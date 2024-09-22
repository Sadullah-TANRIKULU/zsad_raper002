@AccessControl.authorizationCheck: #CHECK
@Metadata.allowExtensions: true
@EndUserText.label: '###GENERATED Core Data Service Entity'
define root view entity ZI_SAD_MITARBEITER
  as select from ZSAD_MITARBEITER as Mitarbeiter
{
  key id as Id,
  vollname as Vollname,
  rolle as Rolle,
  steuertarif as Steuertarif,
  gehalt as Gehalt,
  wie_alt as WieAlt,
  erfahrung as Erfahrung,
  kinder as Kinder,
  @Semantics.user.createdBy: true
  created_by as CreatedBy,
  @Semantics.systemDateTime.createdAt: true
  created_at as CreatedAt,
  @Semantics.user.localInstanceLastChangedBy: true
  last_changed_by as LastChangedBy,
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  last_changed_at as LastChangedAt,
  @Semantics.systemDateTime.lastChangedAt: true
  local_last_changed_at as LocalLastChangedAt
  
}
