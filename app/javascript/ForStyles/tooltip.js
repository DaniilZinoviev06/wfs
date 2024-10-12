document.addEventListener("turbo:load", () => {
    document.querySelectorAll('.content').forEach(content => {

        const tooltip = content.querySelector('.tooltip');
        let time;

        content.addEventListener('mouseenter', () => {
            time = setTimeout(() => {
                tooltip.style.display = 'block';
            }, 400);
        });

        tooltip.addEventListener('mouseenter', () => {
            clearTimeout(time);
            tooltip.style.display = 'none';
        });

        content.addEventListener('mouseleave', () => {
            clearTimeout(time);
            tooltip.style.display = 'none';
        });
    })
});