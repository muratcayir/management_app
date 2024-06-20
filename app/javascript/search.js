document.addEventListener('DOMContentLoaded', () => {
  const searchInput = document.getElementById('search_input');
  const clearSearchButton = document.getElementById('clear_search');
  const userContainer = document.getElementById('users_list');
  const searchForm = document.getElementById('search_form');

  searchForm.addEventListener('submit', (event) => {
    event.preventDefault();
    fetchUsers(searchInput.value.toLowerCase());
  });

  function displayUsers(users) {
    userContainer.innerHTML = '';
    if (users.length === 0) {
      userContainer.innerHTML = '<p class="px-4 py-2 text-gray-500">Kullanıcı Bulunamadı!</p>';
    } else {
      users.forEach(user => {
        userContainer.appendChild(createUserElement(user));
      });
    }
  }

  async function fetchUsers(searchText = '') {
    try {
      const response = await fetch(`/users/search?query=${searchText}`);
      if (!response.ok) {
        throw new Error('Network response was not ok');
      }
      const data = await response.json();
      displayUsers(data);
    } catch (error) {
      console.error('Error fetching users:', error);
      userContainer.innerHTML = '<p class="px-4 py-2 text-gray-500">Kullanıcıları alırken bir hata oluştu!</p>';
    }
  }

  function createUserElement(user) {
    const userDiv = document.createElement('div');
    userDiv.className = 'flex items-center px-4 py-2 border-b border-gray-200';
    userDiv.innerHTML = `
      <img src="https://picsum.photos/id/${user.id}/50/50" alt="${user.name}" class="w-12 h-12 rounded-full mr-4">
      <div class="flex-grow">
        <p class="text-gray-800 font-semibold">${user.name}</p>
        <p class="text-gray-500">@${user.username}</p>
      </div>
      <a href="/users/${user.username}/edit" class="text-gray-500 ml-4">✎</a>
    `;
    return userDiv;
  }

  function clearSearch() {
    searchInput.value = '';
    fetchUsers();
  }

  function setupEventListeners() {
    searchInput.addEventListener('input', () => {
      if (searchInput.value.length >= 2) {
        fetchUsers(searchInput.value.toLowerCase());
      } else {
        fetchUsers();
      }
    });
    clearSearchButton.addEventListener('click', clearSearch);
  }

  function initialize() {
    searchInput.value = '';
    fetchUsers();
    setupEventListeners();
  }

  initialize();
});
