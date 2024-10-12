document.addEventListener("turbo:load", () => {
    const dropDownBn = document.querySelector('.dropDownBn');
    const dropdown = document.querySelector('.dropDowned');

    dropDownBn.addEventListener('click', (event) => {
        dropdown.style.display = dropdown.style.display === 'block' ? 'none' : 'block';
        event.stopImmediatePropagation();
    });

    document.addEventListener('click', (event) => {
        if (!dropDownBn.contains(event.target) && !dropdown.contains(event.target)) {
            dropdown.style.display = 'none';
        }
    });
});



