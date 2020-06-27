import consumer from "./consumer";

const initChatroomCable = () => {
  document.addEventListener("turbolinks:load", function() {
    const messagesContainer = document.getElementById('messages');
    if (messagesContainer) {
      const id = messagesContainer.dataset.chatroomId;
      consumer.subscriptions.create({ channel: "ChatroomChannel", id: id }, {
        received(data) {
          messagesContainer.insertAdjacentHTML('beforeend', data);
         }
      });
      window.scrollTo(0,document.body.scrollHeight);
    }

  })
}

export { initChatroomCable };
