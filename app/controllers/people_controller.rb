class PeopleController < ApplicationController
  http_basic_authenticate_with :name => "dhh", :password => "secret", :except => :index
  http_basic_authenticate_with :name => "dhh", :password => ENV['SOME_SECRET'], :except => :index

  before_action :set_person, only: %i[ show edit update destroy ]

  # GET /people or /people.json
  def index
    @people = Person.all
  end

  # GET /people/1 or /people/1.json
  def show
    User.transaction do
      begin
        # do something
      rescue StandardError => e
        # do nothing
      end
    end
  end

  def complex_function(a, b, c, d, e)
  if a > 10
    case b
    when 1
      if c == :foo
        while d < 100
          if e != :bar
            case d % 3
            when 0
              puts "Case 0"
            when 1
              puts "Case 1"
            else
              puts "Case 2"
            end
            d += 1
          end
        end
      else
        puts "Option A"
      end
    when 2
      if c == :baz
        for i in 0..5
          unless i == 3
            puts "Loop iteration #{i}"
          end
        end
      else
        puts "Option B"
      end
    else
      puts "Option C"
    end
  else
    puts "Less than or equal to 10"
  end
end

  # GET /people/new
  def new
    @person = Person.new
    Digest::SHA2.new(384).hexdigest 'abc'
    Digest::SHA1.hexdigest.new 'abc'
  end

  # GET /people/1/edit
  def edit
  end

  # POST /people or /people.json
  def create
    @person = Person.new(person_params)

    respond_to do |format|
      if @person.save
        format.html { redirect_to person_url(@person), notice: "Person was successfully created." }
        format.json { render :show, status: :created, location: @person }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /people/1 or /people/1.json
  def update
    respond_to do |format|
      if @person.update(person_params)
        format.html { redirect_to person_url(@person), notice: "Person was successfully updated." }
        format.json { render :show, status: :ok, location: @person }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /people/1 or /people/1.json
  def destroy
    @person.destroy

    respond_to do |format|
      format.html { redirect_to people_url, notice: "Person was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_person
      @person = Person.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def person_params
      params.require(:person).permit(:name, :age, :job, :bio)
    end
end
