class PostsController < ApplicationController
   
   def new
      
      @post = Post.new
       
   end
   
   def create
       
       @post = Post.new(post_params)
       @post.user_id = current_user.id #assinging posts to the users who created it
       respond_to do |f|
           if (@post.save)
               f.html { redirect_to "", notice: "Post Crreated" } # if post is saved then it shows
           else
               f.html{ redirect_to "", notice: "Error: Post Not Saved" } # if post is not created or any error in it
           end 
       end
   end
      
      private 
      def post_params
          
          params.require(:post).permit(:user_id,:content)
      end
      
end