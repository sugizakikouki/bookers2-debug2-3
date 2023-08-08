class BookCommentsController < ApplicationController
    
    def create
        book = Book.find(params[:book_id])
        comment = current_user.book_comments.new(book_comment_params)
        comment.book_id = book.id
        comment.save
        redirect_to request.referer
    end
    
    def destroy
        BookComment.find_by(id: params[:id], book_id: params[:book_id]).destroy
        if book_comment
            book_comment.destroy
        end
        redirect_to request.referer
    end
    
    private
    
    def book_comment_params
        params.require(:book_comment).permit(:comment)
    end
end

