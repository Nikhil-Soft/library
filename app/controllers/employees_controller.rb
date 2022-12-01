class EmployeesController < ApplicationController

	def index
		@employees = Employee.all
	end

	def new 
		@employee = Employee.new
	end

	def create
		@employee = Employee.new(employee_params)
		if @employee.save
			redirect_to @employee
		else
			render :new , status: :unprocessable_entity
		end
	end

	private

	def employee_params
		params.require(:employee).permit(:name)
	end

end
