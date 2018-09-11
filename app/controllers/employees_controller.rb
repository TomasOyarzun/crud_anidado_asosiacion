class EmployeesController < ApplicationController
	def create
		@company = Company.find(params[:company_id])
		@employee = @company.employees.build(employee_params)
		@employee.save
		redirect_to company_path(@employee.company_id)
	end

	def destroy
		@employee = Employee.find(params[:id])
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Category was successfully destroyed.' }
      format.json { head :no_content }
     end
	end

	private
		def employee_params
			params.require(:employee).permit(:first_name, :last_name, :email, :company_id, :area_id)
		end
end
