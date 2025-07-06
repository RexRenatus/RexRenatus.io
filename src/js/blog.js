/* ==========================================================================
   Blog Page JavaScript
   The Grand Digital Architect
   ========================================================================== */

/**
 * Initialize blog page functionality
 */
document.addEventListener('DOMContentLoaded', () => {
    initCategoryFilter();
    initLoadMore();
    initNewsletterForm();
});

/**
 * Category filtering for blog posts
 */
function initCategoryFilter() {
    const categoryButtons = document.querySelectorAll('.category-btn');
    const blogPosts = document.querySelectorAll('.blog-post');
    
    categoryButtons.forEach(button => {
        button.addEventListener('click', () => {
            // Update active button
            categoryButtons.forEach(btn => btn.classList.remove('active'));
            button.classList.add('active');
            
            // Get selected category
            const selectedCategory = button.getAttribute('data-category');
            
            // Filter posts
            blogPosts.forEach(post => {
                if (selectedCategory === 'all' || post.getAttribute('data-category') === selectedCategory) {
                    post.style.display = 'block';
                    setTimeout(() => {
                        post.classList.remove('hidden');
                    }, 10);
                } else {
                    post.classList.add('hidden');
                    setTimeout(() => {
                        post.style.display = 'none';
                    }, 300);
                }
            });
        });
    });
}

/**
 * Load more posts functionality
 */
function initLoadMore() {
    const loadMoreBtn = document.querySelector('.load-more-container .btn');
    
    if (loadMoreBtn) {
        loadMoreBtn.addEventListener('click', () => {
            // Simulate loading more posts
            loadMoreBtn.textContent = 'Loading...';
            loadMoreBtn.disabled = true;
            
            setTimeout(() => {
                // In a real implementation, this would fetch more posts from an API
                loadMoreBtn.textContent = 'No More Posts';
                loadMoreBtn.style.opacity = '0.5';
                loadMoreBtn.style.cursor = 'not-allowed';
            }, 1000);
        });
    }
}

/**
 * Newsletter form handling
 */
function initNewsletterForm() {
    const newsletterForm = document.querySelector('.newsletter-form');
    
    if (newsletterForm) {
        newsletterForm.addEventListener('submit', (e) => {
            e.preventDefault();
            
            const emailInput = newsletterForm.querySelector('input[type="email"]');
            const submitBtn = newsletterForm.querySelector('button[type="submit"]');
            const originalText = submitBtn.textContent;
            
            // Simulate form submission
            submitBtn.textContent = 'Subscribing...';
            submitBtn.disabled = true;
            
            setTimeout(() => {
                // Success feedback
                submitBtn.textContent = '✓ Subscribed!';
                submitBtn.style.background = 'var(--color-success)';
                emailInput.value = '';
                
                // Reset after 3 seconds
                setTimeout(() => {
                    submitBtn.textContent = originalText;
                    submitBtn.style.background = '';
                    submitBtn.disabled = false;
                }, 3000);
            }, 1500);
        });
    }
}

/**
 * Add click handlers to blog posts
 */
document.querySelectorAll('.blog-post').forEach(post => {
    post.addEventListener('click', (e) => {
        // Don't navigate if clicking on a button
        if (e.target.tagName !== 'BUTTON' && e.target.tagName !== 'A') {
            // In a real implementation, this would navigate to the full post
            console.log('Navigate to post:', post.querySelector('.post-title').textContent);
        }
    });
});