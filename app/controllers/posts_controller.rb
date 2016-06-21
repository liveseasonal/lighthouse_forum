class PostsController < ApplicationController

  
   def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  # def create
  #   @post = Post.new(
  #     title:  params[:post][:title],
  #     author: params[:post][:author],
  #     text:   params[:post][:text]
  #   )

  #   if @post.save
  #     redirect_to posts_path
  #   else
  #     render :new
  #   end
  # end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to posts_path
    else
      render :new
    end
  end

   def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(post_params)
      redirect_to posts_path
    else
      render :edit
    end
  end

  protected

  def post_params
    params.require(:post).permit(:title, :author, :text)
  end




  # def index


  # end  

  # def show

  #   posts = [
  #     {
  #       title: "Superstar",
  #       author: "Carly Rae Jepson",
  #       text: <<-eos.gsub(/\s+/, " ").strip
  #         Khurram Virani has been my music idol since I started writing
  #         songs back when I was 4. His voice is a revelation. His stage presence
  #         is unparalleled. And those costumes! He remains an inspiration to this
  #         day.
  #       eos
  #     },
  #     {
  #       title: "Basketball Idol",
  #       author: "Steve Nash",
  #       text: <<-eos.gsub(/\s+/, " ").strip
  #         I remember watching Khurram Virani (#14) play back when he just playing
  #         pickup games on the street. Dude had moves nobody had ever seen. Breaking
  #         ankles. Poppin' threes. Great all-around game.
  #       eos
  #     },
  #     {
  #       title: "Acting Legend",
  #       author: "Michael J. Fox",
  #       text: <<-eos.gsub(/\s+/, " ").strip
  #         Back when I was in university, Khurram Virani was my acting coach. He
  #         studied with the best and it shows. His acting chops were already legendary
  #         before his teaching career began. But it seems he's actually improved!
  #       eos
  #     },
  #     {
  #       title: "Who?",
  #       author: "Vurram Khirani",
  #       text: "Never heard of this guy Khurram Virani, but he sounds great."
  #     }
  #   ]
  #   @post = posts[params[:id].to_i]
  # end

  

end