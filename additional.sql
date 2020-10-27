
--List all employees (Employee ID, name) along with their employment history (all positions held including current position)



SELECT EMPLOYEE.E_ID, EMPLOYEE.E_FirstName, EMPLOYEE.E_MiddleInitial, EMPLOYEE.E_LastName, J_JobTitle,J_StartDate, J_EndDate
FROM EMPLOYEE, JOB_HISTORY
WHERE EMPLOYEE.E_ID = JOB_HISTORY.E_ID
ORDER BY E_ID;


-List all patient appointments for a given medical employee (you pick a sample employee) in a given week (you pick a sample week)

select A_ID, ME_ID FROM APPOINTMENT
WHERE ME_ID = 98088
AND Actual_DateTime between '2019-11-10' and '2019-11-17';   




-List all medication used for a given complaint (you pick a sample complaint)

select M_Name from MEDICATION
where M_ID in (select Inv_ID from INVENTORY_USED
               where Complaint_ID = '1');



-List all consumables used for a given complaint (you pick a sample complaint)

select C_Name from CONSUMABLE
where C_ID in (select Inv_ID from INVENTORY_USED
               where Complaint_ID = '2');


-List the insurance claim amount submitted and amount covered for an appointment of a given patient (you pick a sample patient)

select Amount_Submitted, Amount_Covered, Appointment.A_ID, Appointment.P_ID
from claim, INSURANCENUM, appointment
where Claim.I_PolicyNumber = INSURANCENUM.I_PolicyNumber
and INSURANCENUM.P_ID = Appointment.P_ID
and appointment.P_ID = 10001;



