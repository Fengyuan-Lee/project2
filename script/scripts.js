document.addEventListener('DOMContentLoaded', function () {
    const htmlBodyElement = document.querySelector('body');
    const navbar = document.querySelector('nav');
    const footer = document.querySelector('footer');
    const toggleSwitch = document.getElementById('changeImageUrl');
    const isDarkTheme = localStorage.getItem('theme') == "light";
    setTheme(isDarkTheme)
    toggleSwitch.checked = isDarkTheme
    toggleSwitch.addEventListener('change', function () {
        const newTheme = this.checked;
        localStorage.setItem('theme', newTheme ? 'light' : 'dark')
        setTheme(newTheme)
    });

    // Switch themes
    function setTheme(isLight) {
        htmlBodyElement.classList.toggle('dark', !isLight);
        htmlBodyElement.classList.toggle('light', isLight);

        navbar.classList.toggle('bg-dark', !isLight);
        navbar.classList.toggle('bg-light', isLight);

        footer.classList.toggle('bg-dark', !isLight);
        footer.classList.toggle('bg-light', isLight);
    }


    if (location.href.includes("/blog-desc.html")) {
        // blog detail
        const URLParams = new URLSearchParams(window.location.search)
        fetch("data/posts.json").then(async value => {
            const data = await value.json();
            const item = data.find(item => {
                return item.title === URLParams.get("title")
            })
            const title = document.querySelector('#blog-desc-title');
            title.innerHTML = item.title;
            const container = document.querySelector('.blog-desc-content');
            container.innerHTML = item.content
        });
    } else if (location.href.includes("/blog.html")) {
        // blog list
        fetch("data/posts.json").then(async value => {
            const data = await value.json();
            var blogList = document.querySelector('.blog-list');
            blogList.innerHTML = '';
            data.forEach((item, index) => {
                var newBlogItem = document.createElement('div');
                newBlogItem.className = 'blog-item';
                var newTitle = document.createElement('h3');
                newTitle.className = 'blog-item-title';
                newTitle.innerHTML = index + 1 + ". " + item.title;
                newBlogItem.appendChild(newTitle);
                var newContent = document.createElement('p');
                newContent.className = 'blog-item-content';
                newContent.innerHTML = item.description;
                newBlogItem.appendChild(newContent);
                newTitle.addEventListener('click', function () {
                    window.location.href = './blog-desc.html?title=' + item.title;
                });
                newContent.addEventListener('click', function () {
                    window.location.href = './blog-desc.html?title=' + item.title;
                });
                blogList.appendChild(newBlogItem);
            })
        })
    }
});

