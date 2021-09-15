import React from "react";

const Comment = ({ username, message }) => {
  return (
    <>
      <h5>{username}:</h5>
      <p>{message}</p>
    </>
  );
};

export default Comment;
