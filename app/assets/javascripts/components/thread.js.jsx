var Thread = React.createClass({
  getInitialState: function() {
    return {
      thread: this.props.thread,
      messages: this.props.messages,
      userId: this.props.user_id,
      userName: this.props.user_name,
      creatorId: this.props.creator_id
    }
  },
  newMessage: function(message){
    console.log('adding new message: ' + message);
    m = this.state.messages;
    m.push({text: message, first_name: this.state.userName});
    console.log(m);
    this.setState({ messages: m });
  },
  render: function() {
    return (
      <div className="container panel panel-default">
        <ThreadHeader title={this.state.thread.title} />
        <ThreadBody>
          <MessageList messages={this.state.messages} user={{userId: this.state.userId, userName: this.state.userName, creatorId: this.state.creatorId}} thread={this.state.thread} />
        </ThreadBody>
        <NewMessageForm thread={this.state.thread} newMessage={this.newMessage} />
      </div>
    );
  }
});

var ThreadHeader = React.createClass({
  render: function() {
    return (
      <header className="row panel-heading">
        <h3>{this.props.title}</h3>
      </header>
    )
  }
});

var ThreadBody = React.createClass({
  render: function() {
    return (
      <div className="row">
        {this.props.children}
      </div>
    )
  }
});

var MessageList = React.createClass({
  render: function() {
    var user = this.props.user;
    var thread = this.props.thread;
    var messages = this.props.messages.map(function(message, index){
      var agreementsURL = '/agreements/new?user2=' + message.user_id + '&' + thread.discussable_type + '=' + thread.discussable_id;
      return (
        <Message key={index} body={message.text} first_name={message.first_name} agreementsURL={agreementsURL} user={user} />
      )
    });
    return (
      <ul style={{margin: 0, padding: 0, marginBottom: 20}}>
        {messages}
      </ul>
    )
  }
});

var Message = React.createClass({
  render: function(){
    var handShakeImage = (
      <a href={this.props.agreementsURL}>
        <img style={{float: 'right'}} src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAABrklEQVRIS9WV4TEEURCE+yJABGSACBABGRwRcBEgAkSAEETARcBlQASI4NSnpqvm3u279/5cKa/q6mp3Z6ene3pmR1rzGa05v/4cYEfSOFhOJb0kxqeSDiTdSXqrKQEDkrwXAdy7l3SY7j9KIumJpJt4z4/PJD0MgQAwjwoIoBKS8POZSbqIi8sCNOe8lTRJN/ZgaIAaQ6omORVn0Fo8BX7lIloAW8FqO2X8TnIAurHKiT0A9IckJEYGflTJQQYaXwVpAdA8EtBYekTTz+P/StJ1C6QFQJUkhgVy4K58sCg9qjLJAEhgP+Pv3gML2AyCGAArQp8K7QLmoPd4DkqQmQeNREiAzwHAPVTFde8xyGZis7CLSGw34BRmgOauAuEdVshxVLFfro287GgWCa2/V4MHLTNBUuSkIPpGLBKjgi38G19uU4KeUybcQ1U4yVX6MQ7yoLEiYL10htY1IATvRjQMqJCesFk/0jN0h0kevgWQ2veAF5DLK+Ipqv0MCbgG7KhY4V0MHITlXuOChACiN8yWmlmzWuuLZl2Rh+ZhQSSpfmBKoBZA7wxU4/4/wA9/mWBSqCKFOQAAAABJRU5ErkJggg=="/>
      </a>
    );
    var user = this.props.user;
    console.log(this.props);
    var initialUser = user.userId === user.creatorId && this.props.first_name !== user.userName;
    return (
      <li style={{margin: 0, padding: 10, borderBottom: '1px solid #ddd', listStyle: 'none'}}>
        <div style={{fontSize: 18, fontWeight: 'bold'}}>
          {this.props.first_name}
          {initialUser ? handShakeImage : ''}
        </div>
        <p style={{fontWeight: 300}}>{this.props.body}</p>
      </li>
    )
  }
});

var NewMessageForm = React.createClass({
  handleSubmit: function(e){
    e.preventDefault();
    textarea = React.findDOMNode(this.refs.message).value.trim();
    this.props.newMessage(textarea);
    $.ajax({
      url: '/message',
      method: 'POST',
      data: {thread_id: this.props.thread.id, user_id: 2, text: textarea}
    }).success(function(data){
      console.log(data);
    }).fail(function(data){
      console.log('fail');
      console.log(data);
    });
  },
  render: function(){
    return (
      <div>
        <p style={{fontSize: 18}}>Post New Message</p>
        <form onSubmit={this.handleSubmit}>
          <textarea className="form-control" ref="message" rows="3"></textarea>
          <input type="submit" className="btn btn-primary top-10 bottom-10 pull-right" />
        </form>
      </div>
  )}
});
