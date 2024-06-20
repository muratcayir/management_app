# User Management System

This project is a web application for managing users, including searching, listing, and updating user information. Users are fetched from the JSONPlaceholder API and stored in a PostgreSQL database. The application uses Tailwind CSS for a modern interface.

## Features

- List users
- Search users
- View user details
- Edit user information
- View album and photo details

## Installation

### Requirements

- Ruby 3.0.0+
- Rails 6.0.0+
- PostgreSQL

### Steps

1. Clone the repository:

   ```sh
   git clone https://github.com/your-username/user-management-system.git
   cd user-management-system

### Install the required gems:

- bundle install

### Create and migrate the database:

- rails db:create
- rails db:migrate

### Fetch and seed the data:

- rails fetch_data:fetch

### Start the server:

- rails server

## Usage

### User Search
- Enter a username in the search box on the homepage to search for users.
- Search results will be displayed instantly in the list.

### Edit User
- Click the edit icon in the user list to open the user edit modal.
- Update the user information and click the "Update" button to save changes.

### View Album and Photo Details
- On the user details page, you can list the user's albums.
- Click on an album to view album details and photos.

## Structure

### Models
- User: Stores user information.
- Address: Stores user address information.
- Company: Stores user company information.
- Album: Stores user albums.
- Photo: Stores photos in an album.

### Controllers
- UsersController: Manages user operations (listing, searching, editing, updating).
- AlbumsController: Manages album operations (listing, viewing details).
- Company: Stores user company information.
- Album: Stores user albums.
- Photo: Stores photos in an album.

### Services
- UserFetcher: Fetches user data from the JSONPlaceholder API and saves it to the database.
- AlbumFetcher: Fetches album data from the JSONPlaceholder API and saves it to the database.
- PhotoFetcher: Fetches photo data from the JSONPlaceholder API and saves it to the database.

