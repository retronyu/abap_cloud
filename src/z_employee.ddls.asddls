@AbapCatalog.sqlViewName: 'Z_EMPLOYEE1'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'VISTA BASE PARA EMPLEADOS'
@Metadata.ignorePropagatedAnnotations: true
define root view Z_EMPLOYEE
  as select from zemployeee_gp
  association [0..1] to zdepartment_gp as _Department on _Department.department_id = zemployeee_gp.department
  association [0..*] to zassignment_gp as _Assignments on _Assignments.employee_id = zemployeee_gp.employee_id


{
  key employee_id                 as EmployeeId,
      first_name                  as FirstName,
      last_name                   as LastName,

      _Department.department_id   as DepartmentId,
      _Department.department_name as DepartmentName,
      created_at                  as CreatedAt,
      created_by                  as CreatedBy,

      _Assignments // Asociación a las asignaciones de equipos


}
