# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

  @Blogs = React.createClass
    getInitialState: ->
      blogs: @props.data
    getDefaultProps: ->
      blogs: []
    render: ->
      React.DOM.div
        idName: 'my_entries'
        React.DOM.h2
          for blog in @state.blogs
            React.createElement Blog, blog: blog
