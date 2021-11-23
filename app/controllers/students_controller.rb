class StudentsController < ApplicationController

  def index
    name = (params[:name] ? params[:name].camelize : nil)
    f_name = Student.find_by(first_name: name)
    l_name = Student.find_by(last_name: name)
    students = (!name ? Student.all : (f_name ? [{first_name: f_name.first_name, last_name: f_name.last_name, grade: f_name.grade}] : [{first_name: l_name.first_name, last_name: l_name.last_name, grade: l_name.grade}]))
    render json: students
  end

  def show
    student = Student.find(params[:id])
    render json: student
  end

end
