document.addEventListener('DOMContentLoaded', function() {
    // Theme toggle functionality
    const themeToggle = document.getElementById('themeToggle');
    const html = document.documentElement;
    
    // Check for saved theme preference or use preferred color scheme
    const savedTheme = localStorage.getItem('theme') || 
                      (window.matchMedia('(prefers-color-scheme: dark)').matches ? 'dark' : 'light');
    
    // Apply the saved theme
    if (savedTheme === 'dark') {
        html.classList.add('dark');
        themeToggle.innerHTML = '<i data-feather="sun"></i>';
    } else {
        html.classList.remove('dark');
        themeToggle.innerHTML = '<i data-feather="moon"></i>';
    }
    
    // Toggle theme on button click
    themeToggle.addEventListener('click', function() {
        html.classList.toggle('dark');
        
        if (html.classList.contains('dark')) {
            localStorage.setItem('theme', 'dark');
            themeToggle.innerHTML = '<i data-feather="sun"></i>';
        } else {
            localStorage.setItem('theme', 'light');
            themeToggle.innerHTML = '<i data-feather="moon"></i>';
        }
        
        feather.replace();
    });
    
    // Replace all feather icons
    feather.replace();
    
    // Add animation to buttons on hover
    const buttons = document.querySelectorAll('a');
    buttons.forEach(button => {
        button.addEventListener('mouseenter', () => {
            button.classList.add('transform', 'scale-105');
        });
        button.addEventListener('mouseleave', () => {
            button.classList.remove('transform', 'scale-105');
        });
    });
});
