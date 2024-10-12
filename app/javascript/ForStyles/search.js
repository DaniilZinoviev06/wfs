document.addEventListener("turbo:load", () => {
    const searchInput = document.querySelector('.search-input');
    const blockSearch = document.querySelector('.block-search');
    const searchModes = blockSearch.querySelectorAll('.search-mode');
    const dropdownmenu = document.querySelector('.drop-down-menu');

    const showBlockSearch = () => {
        blockSearch.style.display = 'block';
    };

    const hideBlockSearch = () => {
        blockSearch.style.display = 'none';
    };

    searchInput.addEventListener('focus', showBlockSearch);

    document.addEventListener('click', (event) => {
        if (!searchInput.contains(event.target) && !blockSearch.contains(event.target)) {
            hideBlockSearch();
        }
    });

    searchModes.forEach(mode => {
        mode.addEventListener('mousedown', (event) => {
            event.preventDefault();
            searchModes.forEach(m => m.classList.remove('active'));
            mode.classList.add('active');
        });
    });
});
  