// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "./controllers"
import "./search"
import 'stylesheets/application';
import 'alpinejs';

document.addEventListener('DOMContentLoaded', () => {
  const openEditModal = () => {
    document.getElementById('editModal').classList.remove('hidden');
  };

  const closeEditModal = () => {
    document.getElementById('editModal').classList.add('hidden');
  };

  window.openEditModal = openEditModal;
  window.closeEditModal = closeEditModal;
});