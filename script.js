document.addEventListener('DOMContentLoaded', function() {
    const androidBtn = document.getElementById('androidBtn');
    const iosBtn = document.getElementById('iosBtn');
    const androidContent = document.getElementById('androidContent');
    const iosContent = document.getElementById('iosContent');

    // Platform toggle functionality
    androidBtn.addEventListener('click', function() {
        androidBtn.classList.add('active');
        iosBtn.classList.remove('active');
        androidContent.style.display = 'block';
        iosContent.style.display = 'none';
    });

    iosBtn.addEventListener('click', function() {
        iosBtn.classList.add('active');
        androidBtn.classList.remove('active');
        iosContent.style.display = 'block';
        androidContent.style.display = 'none';
    });

    // Add animation to buttons on hover
    const downloadButtons = document.querySelectorAll('.download-btn');
    downloadButtons.forEach(button => {
        button.addEventListener('mouseenter', function() {
            this.style.transform = 'translateY(-3px)';
            this.style.boxShadow = '0 5px 15px rgba(0, 242, 254, 0.4)';
        });

        button.addEventListener('mouseleave', function() {
            this.style.transform = 'translateY(0)';
            this.style.boxShadow = 'none';
        });
    });
});
