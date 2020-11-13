import React from 'react';
import UsernameUpdateForm from './username_update_form';

const UserIndexItem = ({ user }) => {
    return (
        <div>
            <h1>{user.username}</h1>
            <UsernameUpdateForm user={user} />
        </div>
    );
}

export default UserIndexItem;