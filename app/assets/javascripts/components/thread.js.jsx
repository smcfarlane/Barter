var Thread = React.createClass({
  getInitialState: function() {
    return {
      thread: this.props.thread,
      messages: this.props.messages,
      user: this.props.user
    }
  },
  newMessage: function(message){
    console.log('adding new message: ' + message);
    m = this.state.messages;
    m.push({text: message, first_name: 'anon', last_name: '', user_id: 0});
    console.log(m);
    this.setState({ messages: m });
  },
  render: function() {
    return (
      <div className="container panel panel-default">
        <ThreadHeader title={this.state.thread.title} />
        <ThreadBody>
          <MessageList messages={this.state.messages} />
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
      <div className="row panel-body">
        {this.props.children}
      </div>
    )
  }
});

var MessageList = React.createClass({
  render: function() {
    console.log(this.props.messages);
    var messages = this.props.messages.map(function(message, index){
      return (
        <Message key={index} body={message.text} first_name={message.first_name} last_name={message.last_name} />
      )
    });
    return (
      <div>
        {messages}
      </div>
    )
  }
});

var Message = React.createClass({
  render: function(){
    return (
      <div className="well well-sm">
        <p>{this.props.body}</p>
        <p>-{this.props.first_name} {this.props.last_name}</p>
      </div>
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
    <ul className="list-group">
      <li className="list-group-item form-group">
        <form onSubmit={this.handleSubmit}>
          <textarea className="form-control" ref="message" rows="3"></textarea>
          <input type="submit" className="btn btn-primary top-10 bottom-10 pull-right" />
        </form>
      </li>
    </ul>
  )}
});
