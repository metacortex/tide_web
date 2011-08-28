$(function(){
  
if (window._CommentApp) {

  // model: Comment
  window.Comment = Backbone.Model.extend({
    
    defaults: {
      body: "",
      user_id: "",
      post_id: ""
    },

    initialize: function() {
    },

    clear: function() {
      this.destroy();
      this.view.remove();
    }

  });
  

  window.CommentList = Backbone.Collection.extend({

    model: Comment,
    url :'/posts/' + window._postID + '/comments'

  });

  window.Comments = new window.CommentList;


  // model: Agreement
  window.Agreement = Backbone.Model.extend({
    
    defaults: {
      post_id: "",
      event_id: "",
      comment_id: "",
      user_id: "",
      direction: 0
    },

    initialize: function() {
    },

    clear: function() {
      this.destroy();
      this.view.remove();
    }

  });
  

  window.AgreementList = Backbone.Collection.extend({

    model: Agreement,
    url :'/agreements/'

  });

  window.Agreements = new window.AgreementList;


  // view: Comment
  window.CommentView = Backbone.View.extend({
    
    tagName: "li",
    className: "comment",
    
    template: $('#comment_template'),
    edit_template: $('#comment_edit_template'),
    
    
    events: {
      "click .edit_button"    : "edit",
      "click .cancel_button"  : "cancel",
      "click .destroy_button" : "destroy",
      "submit form.edit_comment" : "save"
    },
    
    initialize: function() {
      this.model.bind('change', this.render, this);
      this.model.bind('destroy', this.remove, this);
    },
    
    render: function() {
      this.show();
      return this;
    },
    
    edit: function() {
      $(this.el).html(this.edit_template.tmpl(this.model.toJSON()));
      return false;
    },
    
    cancel: function() {
      this.show();
      return false;
    },
    
    show: function() {
      $(this.el).html(this.template.tmpl(this.model.toJSON()));
    },
    
    save: function() {
      var input = $("form.edit_comment textarea");
      var text = input.val();
      if (!text || text.length < 1) {
        alert("내용을 입력해주세요.");
        return false;
      }

      this.model.save({ body: text });
      this.show();
      return false;
    },
    
    destroy: function() {
      if (confirm("Are you sure?")) {
        this.model.clear();
      }
      return false;
    },
    
    remove: function() {
      
    }
    
    
  });


  // view: CommentApp
  window.CommentAppView = Backbone.View.extend({
    
    el: $("#comments_app"),

    events: {
      "submit form.new_comment" : "create"
    },
    
    initialize: function() {
      Comments.bind('add',   this.addOne, this);
      Comments.bind('reset', this.addAll, this);
      // Comments.fetch();
      // Agreements.fetch();
      Comments.reset(window._commentsData);
      Agreements.reset(window._agreementsData);
    },
    
    create: function() {
      var input = $("form.new_comment textarea");
      var text = input.val();
      if (!text || text.length < 1) {
        alert("내용을 입력해주세요.");
        return false;
      }

      Comments.create({ body: text, user_id: window._userID, post_id: window._postID });

      input.val('');
      return false;
    },
    
    addOne: function(comment) {
      var view = new CommentView({ model: comment, id: "comment_" + comment.id });
      this.$("#comments").append(view.render().el);
    },
    
    addAll: function() {
      Comments.each(this.addOne);
    }
    
  });
  
  
  window.CommentApp = new window.CommentAppView;

} // _CommentApp
});
