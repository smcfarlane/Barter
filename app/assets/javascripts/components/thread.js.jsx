var Thread = React.createClass({
  getInitialState: function() {
    return {
      thread: this.props.thread,
      messages: this.props.messages,
      userId: this.props.user_id,
      userName: this.props.user_name,
      creatorId: this.props.creator_id,
      actionTaken: this.props.action_taken
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
    console.log(this.state);
    return (
      <div className="container panel panel-default">
        <ThreadHeader title={this.state.thread.title} />
        <ThreadBody>
          <MessageList messages={this.state.messages} user={{userId: this.state.userId, userName: this.state.userName, creatorId: this.state.creatorId}} thread={this.state.thread} actionTaken={this.state.actionTaken} />
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
    var actionTaken = this.props.actionTaken;
    var messages = this.props.messages.map(function(message, index){
      if (actionTaken) {
        var agreementsURL = 'javascript:void(0)';
        var btnCSS = 'btn btn-success disabled';
      } else {
        var agreementsURL = '/agreements/new?user2=' + message.user_id + '&' + thread.discussable_type + '=' + thread.discussable_id;
        var btnCSS = 'btn btn-success';
      }

      return (
        <Message key={index} body={message.text} first_name={message.first_name} agreementsURL={agreementsURL} user={user} btnCSS={btnCSS} />
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
      <a style={{float: 'right'}} className={this.props.btnCSS} href={this.props.agreementsURL}>
        <img src="data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAABgAAAAYCAYAAADgdz34AAABzElEQVRIS8WV8TEEYQzF36sAFdCBUwEqoAOnAlTgVIAKUIIKUAHXARU4FcT8TGI+d7e36w8jMzs7u5vNy0te8ll/bP7j+PpfgIjYknSULJ9sPxbjiBhL2pV0bfulqxImiO3X1iED30jaa97f2R5HxKGkS0mAlx3bvl0GAkBIIgMcuJMZV9lU0mk+nM+BtjGvbJ81DEcwLIAuhncZnIxb0C5/Epy1SfQBbCSrzSbiR7LlFaBrq5Q4BID+EITAV1y2yVIRQRlofCdIH8BxBqCx9Iimn+R9YvuiD6QPgEQJDAvK0SqHb0j0dBVIC0AJSs/oe6hd2J50gRQAUoQ+GZYKmIOh9jUHS0CmX4OWUSgBOp/Z3oiIST7/FmRd0qim/nsXRQSZlxpQCzNAcwHtMv55knSQDjvza6MFYFoJWPWv1cB7Bq01SgpzEqJvJEOJxyXhcv6xTSMCp4cmEurZSSVVlvX5uhm0M9uwXrCFdZ0gOG+nNwzIkJ6wWd+ab8wJTL6Hbx5h6XkQEQBQrloR95nte6qMZ8D22xU+iEE5peSe8/ne9mFEUG+YLTSzSwUrT7Rkwr+shVlEIEHOj84DZlCJhgp/iN//nslDMuzz+QQ9QcA6X4VeQAAAAABJRU5ErkJggg=="/>
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
