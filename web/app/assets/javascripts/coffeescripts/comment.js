$(function(){
  
if (window._CommentApp) {

  // model: Comment
  window.Comment = Backbone.Model.extend({
    
    defaults: {
      body: "",
      user_id: "",
      post_id: "",
      positive_agreements_count: 0,
      negative_agreements_count: 0
    },

    initialize: function() {
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
      "submit form.edit_comment" : "save",
      "click a.agree_positive" : "agree_positive",
      "click a.agree_negative" : "agree_negative"
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
        this.model.destroy();
        $(this.el).remove();
      }
      return false;
    },
    
    should_create_agreement_model: true,
    
    agree_positive: function() {
      if (!window._userID) {
        alert("로그인이 필요합니다.");
        return false;
      }

      var a = this.current_comment_agreement();
      console.log(a);
      
      if (a) {
        if (a.get("direction") < 0) {
          a.save({ direction:1 });
          this.model.set({ 
            positive_agreements_count:(this.model.get("positive_agreements_count") + 1),
            negative_agreements_count:(this.model.get("negative_agreements_count") - 1)
          });
        }
      } else if (this.should_create_agreement_model) {
        this.should_create_agreement_model = false;
        var ag = Agreements.create({ post_id:window._postID, event_id:window._eventID, comment_id:this.model.id, user_id:window._userID, direction:1 });
        this.model.set({ positive_agreements_count:(this.model.get("positive_agreements_count") + 1) });
      }
      
      return false;
    },
    
    agree_negative: function() {
      if (!window._userID) {
        alert("로그인이 필요합니다.");
        return false;
      }

      var a = this.current_comment_agreement();
      
      if (a) {
        if (a.get("direction") > 0) {
          a.save({ direction:-1 });
          this.model.set({ 
            positive_agreements_count:(this.model.get("positive_agreements_count") - 1),
            negative_agreements_count:(this.model.get("negative_agreements_count") + 1)
          });
        }
      } else if (this.should_create_agreement_model) {
        this.should_create_agreement_model = false;
        var ag = Agreements.create({ post_id:window._postID, event_id:window._eventID, comment_id:this.model.id, user_id:window._userID, direction:-1 });
        this.model.set({ negative_agreements_count:(this.model.get("negative_agreements_count") + 1) });
      }

      return false;
    },
    
    current_comment_agreement: function() {
      return Agreements.find(function(ag){ 
        return (ag.get("user_id") == window._userID) && (ag.get("comment_id") == this.model.id);
      }, this);
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

      var c = Comments.create({ body: text, user_id: window._userID, post_id: window._postID, user:{name: window._userName} });

      input.val('');
      return false;
    },
    
    addOne: function(comment) {
      var view = new CommentView({ model: comment, id: "comment_" + (comment.id || comment.cid) });
      this.$("#comments").prepend(view.render().el);
    },
    
    addAll: function() {
      Comments.each(this.addOne);
    }
    
  });
  
  
  window.CommentApp = new window.CommentAppView;

} // _CommentApp
});
