/* ==========================================================================
   Enhanced Main JavaScript - GitHub Directory Landing Page
   The Grand Digital Architect
   ========================================================================== */

/**
 * Enhanced Particle System with Performance Optimizations
 * Creates interactive particles with constellation connections
 */
class ParticleSystem {
    constructor() {
        this.container = document.getElementById('particles');
        if (!this.container) return;
        
        // Check for reduced motion preference
        this.prefersReducedMotion = window.matchMedia('(prefers-reduced-motion: reduce)').matches;
        if (this.prefersReducedMotion) {
            this.createStaticStars();
            return;
        }
        
        // Performance optimizations
        this.isMobile = window.innerWidth <= 768;
        this.isLowPerformance = this.detectLowPerformance();
        
        this.canvas = document.createElement('canvas');
        this.ctx = this.canvas.getContext('2d');
        this.particles = [];
        this.mouse = { x: 0, y: 0 };
        this.connectionDistance = this.isMobile ? 100 : 150;
        this.lastFrameTime = 0;
        this.frameInterval = 1000 / 30; // Target 30 FPS on mobile
        
        this.init();
    }
    
    detectLowPerformance() {
        // Simple performance detection
        const canvas = document.createElement('canvas');
        const ctx = canvas.getContext('2d');
        const start = performance.now();
        
        // Perform simple drawing operations
        for (let i = 0; i < 100; i++) {
            ctx.beginPath();
            ctx.arc(50, 50, 30, 0, Math.PI * 2);
            ctx.fill();
        }
        
        const elapsed = performance.now() - start;
        return elapsed > 10; // If simple operations take > 10ms, assume low performance
    }
    
    createStaticStars() {
        // For users who prefer reduced motion, create static stars
        const staticContainer = document.createElement('div');
        staticContainer.className = 'static-stars';
        staticContainer.setAttribute('aria-hidden', 'true');
        
        const starCount = 30;
        for (let i = 0; i < starCount; i++) {
            const star = document.createElement('div');
            star.className = 'static-star';
            star.style.left = `${Math.random() * 100}%`;
            star.style.top = `${Math.random() * 100}%`;
            star.style.animationDelay = `${Math.random() * 3}s`;
            staticContainer.appendChild(star);
        }
        
        this.container.appendChild(staticContainer);
    }
    
    init() {
        // Setup canvas
        this.container.appendChild(this.canvas);
        this.canvas.style.position = 'absolute';
        this.canvas.style.top = '0';
        this.canvas.style.left = '0';
        this.canvas.style.width = '100%';
        this.canvas.style.height = '100%';
        this.canvas.style.pointerEvents = 'none';
        
        this.resize();
        this.createParticles();
        this.addEventListeners();
        this.animate();
    }
    
    resize() {
        this.canvas.width = this.container.offsetWidth;
        this.canvas.height = this.container.offsetHeight;
        this.isMobile = window.innerWidth <= 768;
    }
    
    createParticles() {
        // Adaptive particle count based on performance and device
        let particleCount = 50;
        if (this.isMobile) particleCount = 20;
        if (this.isLowPerformance) particleCount = Math.floor(particleCount / 2);
        
        for (let i = 0; i < particleCount; i++) {
            this.particles.push({
                x: Math.random() * this.canvas.width,
                y: Math.random() * this.canvas.height,
                vx: (Math.random() - 0.5) * 0.3,
                vy: (Math.random() - 0.5) * 0.3,
                size: Math.random() * 2 + 1,
                color: `hsl(${Math.random() * 60 + 30}, 100%, 70%)`,
                pulsePhase: Math.random() * Math.PI * 2
            });
        }
    }
    
    addEventListeners() {
        window.addEventListener('resize', () => {
            this.resize();
            this.particles = [];
            this.createParticles();
        });
        
        // Only track mouse on desktop
        if (!this.isMobile) {
            this.container.addEventListener('mousemove', (e) => {
                const rect = this.canvas.getBoundingClientRect();
                this.mouse.x = e.clientX - rect.left;
                this.mouse.y = e.clientY - rect.top;
            });
            
            this.container.addEventListener('mouseleave', () => {
                this.mouse.x = -1000;
                this.mouse.y = -1000;
            });
        }
    }
    
    updateParticles() {
        this.particles.forEach(particle => {
            // Update position
            particle.x += particle.vx;
            particle.y += particle.vy;
            
            // Wrap around edges instead of bouncing
            if (particle.x < 0) particle.x = this.canvas.width;
            if (particle.x > this.canvas.width) particle.x = 0;
            if (particle.y < 0) particle.y = this.canvas.height;
            if (particle.y > this.canvas.height) particle.y = 0;
            
            // Mouse attraction (desktop only)
            if (!this.isMobile) {
                const dx = this.mouse.x - particle.x;
                const dy = this.mouse.y - particle.y;
                const distance = Math.sqrt(dx * dx + dy * dy);
                
                if (distance < 200) {
                    const force = (200 - distance) / 200;
                    particle.vx += dx * force * 0.001;
                    particle.vy += dy * force * 0.001;
                }
            }
            
            // Limit velocity
            const maxSpeed = this.isMobile ? 0.5 : 1;
            const currentSpeed = Math.sqrt(particle.vx * particle.vx + particle.vy * particle.vy);
            if (currentSpeed > maxSpeed) {
                particle.vx = (particle.vx / currentSpeed) * maxSpeed;
                particle.vy = (particle.vy / currentSpeed) * maxSpeed;
            }
            
            // Update pulse
            particle.pulsePhase += 0.02;
        });
    }
    
    drawConnections() {
        // Skip connections on low performance devices
        if (this.isLowPerformance) return;
        
        this.ctx.strokeStyle = 'rgba(255, 215, 0, 0.1)';
        this.ctx.lineWidth = 1;
        
        for (let i = 0; i < this.particles.length; i++) {
            for (let j = i + 1; j < this.particles.length; j++) {
                const dx = this.particles[i].x - this.particles[j].x;
                const dy = this.particles[i].y - this.particles[j].y;
                const distance = Math.sqrt(dx * dx + dy * dy);
                
                if (distance < this.connectionDistance) {
                    const opacity = (1 - distance / this.connectionDistance) * 0.3;
                    this.ctx.strokeStyle = `rgba(255, 215, 0, ${opacity})`;
                    this.ctx.beginPath();
                    this.ctx.moveTo(this.particles[i].x, this.particles[i].y);
                    this.ctx.lineTo(this.particles[j].x, this.particles[j].y);
                    this.ctx.stroke();
                }
            }
        }
    }
    
    drawParticles() {
        this.particles.forEach(particle => {
            const pulse = Math.sin(particle.pulsePhase) * 0.5 + 0.5;
            const size = particle.size * (1 + pulse * 0.3);
            
            // Simplified rendering for mobile
            if (this.isMobile || this.isLowPerformance) {
                this.ctx.fillStyle = particle.color;
                this.ctx.beginPath();
                this.ctx.arc(particle.x, particle.y, size, 0, Math.PI * 2);
                this.ctx.fill();
            } else {
                // Glow effect for desktop
                const gradient = this.ctx.createRadialGradient(
                    particle.x, particle.y, 0,
                    particle.x, particle.y, size * 3
                );
                gradient.addColorStop(0, particle.color);
                gradient.addColorStop(1, 'transparent');
                
                this.ctx.fillStyle = gradient;
                this.ctx.beginPath();
                this.ctx.arc(particle.x, particle.y, size * 3, 0, Math.PI * 2);
                this.ctx.fill();
                
                // Core
                this.ctx.fillStyle = particle.color;
                this.ctx.beginPath();
                this.ctx.arc(particle.x, particle.y, size, 0, Math.PI * 2);
                this.ctx.fill();
            }
        });
    }
    
    animate(currentTime) {
        // Frame rate limiting for mobile
        if (this.isMobile) {
            const elapsed = currentTime - this.lastFrameTime;
            if (elapsed < this.frameInterval) {
                requestAnimationFrame((time) => this.animate(time));
                return;
            }
            this.lastFrameTime = currentTime;
        }
        
        this.ctx.clearRect(0, 0, this.canvas.width, this.canvas.height);
        
        this.updateParticles();
        this.drawConnections();
        this.drawParticles();
        
        requestAnimationFrame((time) => this.animate(time));
    }
}

/**
 * Mobile Navigation Menu
 */
class MobileNav {
    constructor() {
        this.nav = document.querySelector('.nav-menu');
        this.header = document.querySelector('.site-header');
        if (!this.nav || !this.header) return;
        
        this.createMobileMenu();
    }
    
    createMobileMenu() {
        // Create hamburger button
        const hamburger = document.createElement('button');
        hamburger.className = 'nav-toggle';
        hamburger.setAttribute('aria-label', 'Toggle navigation menu');
        hamburger.setAttribute('aria-expanded', 'false');
        hamburger.innerHTML = `
            <span class="hamburger-line"></span>
            <span class="hamburger-line"></span>
            <span class="hamburger-line"></span>
        `;
        
        // Insert hamburger after logo
        const logo = this.header.querySelector('.logo');
        logo.parentNode.insertBefore(hamburger, this.nav);
        
        // Toggle menu
        hamburger.addEventListener('click', () => {
            const isOpen = hamburger.getAttribute('aria-expanded') === 'true';
            hamburger.setAttribute('aria-expanded', !isOpen);
            this.nav.classList.toggle('nav-open', !isOpen);
            document.body.classList.toggle('nav-active', !isOpen);
        });
        
        // Close menu on link click
        this.nav.querySelectorAll('a').forEach(link => {
            link.addEventListener('click', () => {
                hamburger.setAttribute('aria-expanded', 'false');
                this.nav.classList.remove('nav-open');
                document.body.classList.remove('nav-active');
            });
        });
        
        // Close menu on escape key
        document.addEventListener('keydown', (e) => {
            if (e.key === 'Escape' && this.nav.classList.contains('nav-open')) {
                hamburger.setAttribute('aria-expanded', 'false');
                this.nav.classList.remove('nav-open');
                document.body.classList.remove('nav-active');
            }
        });
    }
}

/**
 * Enhanced Smooth Scroll with Progress Indicator
 */
function initEnhancedScroll() {
    // Create scroll progress indicator
    const progressBar = document.createElement('div');
    progressBar.className = 'scroll-progress';
    progressBar.setAttribute('role', 'progressbar');
    progressBar.setAttribute('aria-label', 'Page scroll progress');
    progressBar.setAttribute('aria-valuemin', '0');
    progressBar.setAttribute('aria-valuemax', '100');
    document.body.appendChild(progressBar);
    
    // Update progress on scroll
    const updateScrollProgress = () => {
        const scrollTop = window.pageYOffset;
        const docHeight = document.documentElement.scrollHeight - window.innerHeight;
        const scrollPercent = (scrollTop / docHeight) * 100;
        
        progressBar.style.width = `${scrollPercent}%`;
        progressBar.setAttribute('aria-valuenow', Math.round(scrollPercent));
    };
    
    // Throttle scroll events
    let ticking = false;
    window.addEventListener('scroll', () => {
        if (!ticking) {
            requestAnimationFrame(() => {
                updateScrollProgress();
                ticking = false;
            });
            ticking = true;
        }
    });
    
    // Smooth scroll for navigation
    const links = document.querySelectorAll('a[href^="#"]');
    links.forEach(link => {
        link.addEventListener('click', (e) => {
            e.preventDefault();
            
            const targetId = link.getAttribute('href');
            const targetSection = document.querySelector(targetId);
            
            if (targetSection) {
                const offset = 80; // Header height
                const targetPosition = targetSection.offsetTop - offset;
                
                window.scrollTo({
                    top: targetPosition,
                    behavior: 'smooth'
                });
                
                // Update focus for accessibility
                targetSection.setAttribute('tabindex', '-1');
                targetSection.focus();
            }
        });
    });
}

/**
 * Enhanced Intersection Observer with Stagger Effects
 */
function initEnhancedAnimations() {
    const observerOptions = {
        threshold: 0.1,
        rootMargin: '0px 0px -50px 0px'
    };
    
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('in-view');
                
                // Stagger child animations
                const children = entry.target.querySelectorAll('.stagger-item');
                children.forEach((child, index) => {
                    setTimeout(() => {
                        child.classList.add('in-view');
                    }, index * 100);
                });
                
                observer.unobserve(entry.target);
            }
        });
    }, observerOptions);
    
    // Observe sections
    document.querySelectorAll('.section').forEach(section => {
        observer.observe(section);
    });
    
    // Observe individual animated elements
    document.querySelectorAll('.fade-in, .philosophy-item, .step, .timeline-item').forEach(el => {
        observer.observe(el);
    });
}

/**
 * Lazy Loading for Images
 */
function initLazyLoading() {
    const imageObserver = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                const img = entry.target;
                if (img.dataset.src) {
                    img.src = img.dataset.src;
                    img.classList.add('loaded');
                    imageObserver.unobserve(img);
                }
            }
        });
    }, {
        rootMargin: '50px 0px'
    });
    
    document.querySelectorAll('img[data-src]').forEach(img => {
        imageObserver.observe(img);
    });
}

/**
 * Enhanced Header with Hide/Show on Scroll
 */
function initEnhancedHeader() {
    const header = document.querySelector('.site-header');
    let lastScroll = 0;
    let scrollDirection = 'up';
    let headerHeight = header.offsetHeight;
    
    const updateHeader = () => {
        const currentScroll = window.pageYOffset;
        
        // Determine scroll direction
        scrollDirection = currentScroll > lastScroll ? 'down' : 'up';
        
        // Show/hide header based on scroll
        if (scrollDirection === 'down' && currentScroll > headerHeight) {
            header.classList.add('header-hidden');
        } else if (scrollDirection === 'up') {
            header.classList.remove('header-hidden');
        }
        
        // Add shadow on scroll
        if (currentScroll > 10) {
            header.classList.add('header-scrolled');
        } else {
            header.classList.remove('header-scrolled');
        }
        
        lastScroll = currentScroll;
    };
    
    // Throttle scroll events
    let ticking = false;
    window.addEventListener('scroll', () => {
        if (!ticking) {
            requestAnimationFrame(() => {
                updateHeader();
                ticking = false;
            });
            ticking = true;
        }
    });
}

/**
 * Performance Monitor
 */
class PerformanceMonitor {
    constructor() {
        this.metrics = {
            fps: 0,
            loadTime: 0,
            resourceCount: 0
        };
        
        this.measureLoadTime();
        this.measureFPS();
    }
    
    measureLoadTime() {
        window.addEventListener('load', () => {
            const perfData = performance.getEntriesByType('navigation')[0];
            this.metrics.loadTime = perfData.loadEventEnd - perfData.loadEventStart;
            console.info(`Page load time: ${this.metrics.loadTime}ms`);
        });
    }
    
    measureFPS() {
        let lastTime = performance.now();
        let frames = 0;
        
        const measureFrame = (currentTime) => {
            frames++;
            
            if (currentTime >= lastTime + 1000) {
                this.metrics.fps = Math.round((frames * 1000) / (currentTime - lastTime));
                frames = 0;
                lastTime = currentTime;
            }
            
            requestAnimationFrame(measureFrame);
        };
        
        requestAnimationFrame(measureFrame);
    }
}

/**
 * Initialize all features when DOM is loaded
 */
document.addEventListener('DOMContentLoaded', () => {
    // Core features
    new ParticleSystem();
    new MobileNav();
    
    // Enhanced features
    initEnhancedScroll();
    initEnhancedAnimations();
    initLazyLoading();
    initEnhancedHeader();
    
    // Performance monitoring in development
    if (window.location.hostname === 'localhost') {
        new PerformanceMonitor();
    }
    
    // Keyboard navigation
    initKeyboardNav();
});

/**
 * Enhanced Keyboard Navigation
 */
function initKeyboardNav() {
    // Skip links
    const skipLinks = document.querySelectorAll('.skip-link');
    skipLinks.forEach(link => {
        link.addEventListener('click', (e) => {
            e.preventDefault();
            const target = document.querySelector(link.getAttribute('href'));
            if (target) {
                target.setAttribute('tabindex', '-1');
                target.focus();
                target.scrollIntoView({ behavior: 'smooth', block: 'start' });
            }
        });
    });
    
    // Keyboard shortcuts
    document.addEventListener('keydown', (e) => {
        // Alt + N: Skip to navigation
        if (e.altKey && e.key === 'n') {
            e.preventDefault();
            document.querySelector('.nav-menu').focus();
        }
        
        // Alt + M: Skip to main content
        if (e.altKey && e.key === 'm') {
            e.preventDefault();
            document.querySelector('#main-content').focus();
        }
    });
    
    // Focus visible states
    document.addEventListener('keydown', (e) => {
        if (e.key === 'Tab') {
            document.body.classList.add('keyboard-nav');
        }
    });
    
    document.addEventListener('mousedown', () => {
        document.body.classList.remove('keyboard-nav');
    });
}

/**
 * Dark Mode Toggle with System Preference Detection
 */
class DarkModeToggle {
    constructor() {
        this.theme = this.getStoredTheme() || this.getSystemPreference();
        this.init();
    }
    
    getStoredTheme() {
        return localStorage.getItem('theme');
    }
    
    getSystemPreference() {
        return window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light';
    }
    
    init() {
        // Apply initial theme
        this.applyTheme(this.theme);
        
        // Create toggle button
        this.createToggleButton();
        
        // Listen for system preference changes
        window.matchMedia('(prefers-color-scheme: dark)').addEventListener('change', (e) => {
            if (!this.getStoredTheme()) {
                this.theme = e.matches ? 'dark' : 'light';
                this.applyTheme(this.theme);
            }
        });
    }
    
    createToggleButton() {
        const button = document.createElement('button');
        button.className = 'theme-toggle';
        button.setAttribute('aria-label', 'Toggle dark mode');
        button.setAttribute('aria-pressed', this.theme === 'dark');
        button.innerHTML = `
            <svg class="theme-icon theme-icon-light" width="20" height="20" viewBox="0 0 20 20" fill="none">
                <circle cx="10" cy="10" r="4" stroke="currentColor" stroke-width="2"/>
                <path d="M10 1V3M10 17V19M19 10H17M3 10H1M16.364 3.636L15 5M5 15L3.636 16.364M16.364 16.364L15 15M5 5L3.636 3.636" stroke="currentColor" stroke-width="2" stroke-linecap="round"/>
            </svg>
            <svg class="theme-icon theme-icon-dark" width="20" height="20" viewBox="0 0 20 20" fill="none">
                <path d="M10 3C10 7.97 14.03 12 19 12C19 16.97 14.97 21 10 21C5.03 21 1 16.97 1 12C1 7.03 5.03 3 10 3Z" stroke="currentColor" stroke-width="2" stroke-linejoin="round"/>
            </svg>
        `;
        
        // Insert after nav menu
        const header = document.querySelector('.site-header');
        const nav = header.querySelector('.nav-menu');
        nav.parentNode.insertBefore(button, nav.nextSibling);
        
        // Add click handler
        button.addEventListener('click', () => {
            this.theme = this.theme === 'light' ? 'dark' : 'light';
            this.applyTheme(this.theme);
            localStorage.setItem('theme', this.theme);
            button.setAttribute('aria-pressed', this.theme === 'dark');
        });
    }
    
    applyTheme(theme) {
        document.documentElement.setAttribute('data-theme', theme);
        
        // Update meta theme color
        const metaTheme = document.querySelector('meta[name="theme-color"]');
        if (!metaTheme) {
            const meta = document.createElement('meta');
            meta.name = 'theme-color';
            meta.content = theme === 'dark' ? '#0A0A0A' : '#FFFFFF';
            document.head.appendChild(meta);
        } else {
            metaTheme.content = theme === 'dark' ? '#0A0A0A' : '#FFFFFF';
        }
        
        // Update particle colors for dark mode
        if (window.particleSystem && window.particleSystem.particles) {
            window.particleSystem.particles.forEach(particle => {
                if (theme === 'dark') {
                    particle.color = `hsl(${Math.random() * 60 + 200}, 70%, 60%)`; // Blue-purple range
                } else {
                    particle.color = `hsl(${Math.random() * 60 + 30}, 100%, 70%)`; // Gold-yellow range
                }
            });
        }
    }
}
/**
 * Loading System with Skeleton Screens
 */
class LoadingSystem {
    constructor() {
        this.init();
    }
    
    init() {
        // Create and show page loader
        this.createPageLoader();
        
        // Set up lazy loading for images
        this.setupImageLoading();
        
        // Hide loader when page is ready
        window.addEventListener('load', () => {
            setTimeout(() => {
                this.hidePageLoader();
            }, 500);
        });
    }
    
    createPageLoader() {
        const loader = document.createElement('div');
        loader.className = 'page-loader';
        loader.innerHTML = `
            <div class="loader-content">
                <div class="loader-icon"></div>
                <div class="loader-text">Loading wisdom...</div>
            </div>
        `;
        document.body.appendChild(loader);
    }
    
    hidePageLoader() {
        const loader = document.querySelector('.page-loader');
        if (loader) {
            loader.classList.add('loaded');
            setTimeout(() => loader.remove(), 500);
        }
    }
    
    setupImageLoading() {
        const images = document.querySelectorAll('img[data-src]');
        
        images.forEach(img => {
            // Wrap image in container if not already wrapped
            if (!img.parentElement.classList.contains('image-container')) {
                const container = document.createElement('div');
                container.className = 'image-container';
                img.parentNode.insertBefore(container, img);
                container.appendChild(img);
            }
            
            // Load image
            const tempImg = new Image();
            tempImg.onload = () => {
                img.src = tempImg.src;
                img.parentElement.classList.add('loaded');
            };
            tempImg.onerror = () => {
                img.parentElement.classList.add('error');
                this.showImageError(img.parentElement);
            };
            
            if (img.dataset.src) {
                tempImg.src = img.dataset.src;
            }
        });
    }
    
    showImageError(container) {
        const error = document.createElement('div');
        error.className = 'error-message';
        error.innerHTML = `
            <p>Failed to load image</p>
            <button class="btn btn-secondary retry-button">Retry</button>
        `;
        container.appendChild(error);
        
        error.querySelector('.retry-button').addEventListener('click', () => {
            error.remove();
            container.classList.remove('error');
            const img = container.querySelector('img');
            if (img && img.dataset.src) {
                this.setupImageLoading();
            }
        });
    }
    
    // Create skeleton screen for dynamic content
    createSkeleton(type = 'text', count = 3) {
        const container = document.createElement('div');
        container.className = 'skeleton-container';
        
        switch(type) {
            case 'text':
                for (let i = 0; i < count; i++) {
                    const line = document.createElement('div');
                    line.className = 'skeleton skeleton-text';
                    container.appendChild(line);
                }
                break;
                
            case 'heading':
                const heading = document.createElement('div');
                heading.className = 'skeleton skeleton-heading';
                container.appendChild(heading);
                break;
                
            case 'card':
                const card = document.createElement('div');
                card.className = 'skeleton skeleton-card';
                container.appendChild(card);
                break;
                
            case 'timeline':
                for (let i = 0; i < count; i++) {
                    const item = document.createElement('div');
                    item.className = 'skeleton-timeline-item';
                    item.innerHTML = `
                        <div class="skeleton skeleton-timeline-emoji"></div>
                        <div class="skeleton-timeline-content">
                            <div class="skeleton skeleton-text"></div>
                            <div class="skeleton skeleton-text"></div>
                        </div>
                    `;
                    container.appendChild(item);
                }
                break;
        }
        
        return container;
    }
    
    // Show loading state for async content
    showContentLoading(element, skeletonType = 'text') {
        element.classList.add('content-loading');
        const skeleton = this.createSkeleton(skeletonType);
        element.appendChild(skeleton);
        
        return () => {
            element.classList.add('content-loaded');
            setTimeout(() => {
                skeleton.remove();
                element.classList.remove('content-loading');
            }, 300);
        };
    }
    
    // Loading state for buttons
    setButtonLoading(button, loading = true) {
        if (loading) {
            button.classList.add('btn-loading');
            button.disabled = true;
        } else {
            button.classList.remove('btn-loading');
            button.disabled = false;
        }
    }
}

/**
 * Enhanced Project Showcase with Loading States
 */
class ProjectShowcase {
    constructor() {
        this.loadingSystem = new LoadingSystem();
        this.init();
    }
    
    init() {
        // Find all project links that need enhancement
        const projectLinks = document.querySelectorAll('.project-list a[href^="https://github.com"]');
        
        projectLinks.forEach(link => {
            const container = link.parentElement;
            
            // Add loading indicator on hover
            link.addEventListener('mouseenter', () => {
                if (!container.dataset.loaded) {
                    this.loadProjectPreview(link.href, container);
                }
            });
        });
    }
    
    async loadProjectPreview(url, container) {
        // Show loading state
        const loading = document.createElement('div');
        loading.className = 'project-loading';
        loading.innerHTML = '<span class="project-spinner"></span>Loading preview...';
        container.appendChild(loading);
        
        try {
            // Simulate API call (replace with actual GitHub API call)
            await new Promise(resolve => setTimeout(resolve, 1000));
            
            // Remove loading state
            loading.remove();
            container.dataset.loaded = 'true';
            
            // Add preview data (placeholder)
            const preview = document.createElement('div');
            preview.className = 'project-preview fade-in-up';
            preview.innerHTML = `
                <p class="project-description">Interactive learning system built with React</p>
                <div class="project-stats">
                    <span>⭐ 42</span>
                    <span>🍴 7</span>
                </div>
            `;
            container.appendChild(preview);
            
            // Trigger animation
            requestAnimationFrame(() => preview.classList.add('visible'));
            
        } catch (error) {
            loading.innerHTML = '<span class="error-message">Failed to load preview</span>';
        }
    }
}

// Update initialization to include loading system
document.addEventListener('DOMContentLoaded', () => {
    // Initialize loading system first
    const loadingSystem = new LoadingSystem();
    
    // Core features
    window.particleSystem = new ParticleSystem();
    new MobileNav();
    new DarkModeToggle();
    
    // Project showcase with loading states
    new ProjectShowcase();
    
    // Enhanced features
    initEnhancedScroll();
    initEnhancedAnimations();
    initLazyLoading();
    initEnhancedHeader();
    
    // Performance monitoring in development
    if (window.location.hostname === 'localhost') {
        new PerformanceMonitor();
    }
    
    // Keyboard navigation
    initKeyboardNav();
    
    // Military service years
    initMilitaryServiceCounter();
});

/**
 * Military Service Years Counter
 * Calculates and displays years of active duty service
 */
function initMilitaryServiceCounter() {
    // Military service start date: July 2020
    const serviceStartDate = new Date('2020-07-01');
    const currentDate = new Date();
    const yearsDiff = currentDate.getFullYear() - serviceStartDate.getFullYear();
    const monthsDiff = currentDate.getMonth() - serviceStartDate.getMonth();
    
    let yearsOfService = yearsDiff;
    if (monthsDiff < 0 || (monthsDiff === 0 && currentDate.getDate() < serviceStartDate.getDate())) {
        yearsOfService--;
    }
    
    // Find the military timeline item and update it
    const militaryTimelineItem = document.querySelector('.timeline-item:nth-child(2) p');
    if (militaryTimelineItem && militaryTimelineItem.textContent.includes('Military service continues')) {
        militaryTimelineItem.innerHTML = `${yearsOfService}+ years active duty<br><small>Service continues</small>`;
    }
}
