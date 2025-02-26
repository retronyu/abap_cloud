@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Vista consumo'
@Metadata.ignorePropagatedAnnotations: true
define root view entity z_department as select from zdepartment_gp

{
    key department_id as DepartmentId,
    department_name as DepartmentName,
    description as Description,
    creation_date as CreationDate
    
}
