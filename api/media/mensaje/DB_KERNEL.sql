/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA BASE DE DATOS DB_KERNEL                        *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
 
use [master]
go

if not exists (select [database_id] from [sys].[databases] where [name] = 'Db_Kernel')
exec ('create database [Db_Kernel]')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LOS ESQUEMAS DE BASE DE DATOS                     *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

use [Db_Kernel]
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DEL ESQUEMA SC_SETTING                               *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [schema_id] from [sys].[schemas] where [name] = 'Sc_Setting')
exec ('create schema [Sc_Setting]')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_APPLICATION                           *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [object_id] from sys.objects where [name] = 'Tb_Application' and [type] = 'U')
exec ('
create table [Sc_Setting].[Tb_Application]
(
	[Application_Id] [uniqueidentifier] not null,
	[Application_Name] [varchar](50) not null,
	[Application_Icon] [uniqueidentifier] null,
	[Application_Logo] [uniqueidentifier] null,
	[Application_Banner] [uniqueidentifier] null,
	[Application_CSS] [varchar](max) null,
	[Application_Status] [uniqueidentifier] not null,
	[Application_CreatedOn] [datetime] not null,
	[Application_CreatedBy] [uniqueidentifier] not null,
	[Application_ModifiedOn] [datetime] not null,
	[Application_ModifiedBy] [uniqueidentifier] not null
)
')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_ENTITY                                *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [object_id] from sys.objects where [name] = 'Tb_Entity' and [type] = 'U')
exec ('
create table [Sc_Setting].[Tb_Entity]
(
	[Entity_Id] [uniqueidentifier] not null,
	[Entity_Value] [varchar](50) not null,
	[Entity_Schema] [uniqueidentifier] not null,
	[Entity_Application] [uniqueidentifier] not null,
	[Entity_Status] [uniqueidentifier] not null,
	[Entity_CreatedOn] [datetime] not null,
	[Entity_CreatedBy] [uniqueidentifier] not null,
	[Entity_ModifiedOn] [datetime] not null,
	[Entity_ModifiedBy] [uniqueidentifier] not null
)
')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_STATUS                                *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [object_id] from sys.objects where [name] = 'Tb_Status' and [type] = 'U')
exec ('
create table [Sc_Setting].[Tb_Status]
(
	[Status_Id] [uniqueidentifier] not null,
	[Status_Entity] [uniqueidentifier] not null,
	[Status_Value] [varchar](50) not null,
	[Status_Order] [int] not null,
	[Status_Application] [uniqueidentifier] not null,
	[Status_Status] [uniqueidentifier] not null,
	[Status_CreatedOn] [datetime] not null,
	[Status_CreatedBy] [uniqueidentifier] not null,
	[Status_ModifiedOn] [datetime] not null,
	[Status_ModifiedBy] [uniqueidentifier] not null
)
')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_ACTION                                *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
 
if not exists (select [object_id] from sys.objects where [name] = 'Tb_Action' and [type] = 'U')
exec ('
create table [Sc_Setting].[Tb_Action]
(
	[Action_Id] [uniqueidentifier] not null,
	[Action_Name] [varchar](50) not null,
	[Action_Entity] [uniqueidentifier] not null,
	[Action_Origin] [uniqueidentifier] not null,
	[Action_Destination] [uniqueidentifier] not null,
	[Action_Application] [uniqueidentifier] not null,
	[Action_Status] [uniqueidentifier] not null,
	[Action_CreatedOn] [datetime] not null,
	[Action_CreatedBy] [uniqueidentifier] not null,
	[Action_ModifiedOn] [datetime] not null,
	[Action_ModifiedBy] [uniqueidentifier] not null
)
')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_CONCEPT                               *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
 
if not exists (select [object_id] from sys.objects where [name] = 'Tb_Concept' and [type] = 'U')
exec ('
create table [Sc_Setting].[Tb_Concept]
(
	[Concept_Id] [uniqueidentifier] not null,
	[Concept_Value] [varchar](50) not null,
	[Concept_Application] [uniqueidentifier] not null,
	[Concept_Status] [uniqueidentifier] not null,
	[Concept_CreatedOn] [datetime] not null,
	[Concept_CreatedBy] [uniqueidentifier] not null,
	[Concept_ModifiedOn] [datetime] not null,
	[Concept_ModifiedBy] [uniqueidentifier] not null
)
')
go
 
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_CATALOG                               *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
 
if not exists (select [object_id] from sys.objects where [name] = 'Tb_Catalog' and [type] = 'U')
exec ('
create table [Sc_Setting].[Tb_Catalog]
(
	[Catalog_Id] [uniqueidentifier] not null,
	[Catalog_Concept] [uniqueidentifier] not null,
	[Catalog_Value] [varchar](50) not null,
	[Catalog_Parent] [uniqueidentifier] null,
	[Catalog_Application] [uniqueidentifier] not null,
	[Catalog_Status] [uniqueidentifier] not null,
	[Catalog_CreatedOn] [datetime] not null,
	[Catalog_CreatedBy] [uniqueidentifier] not null,
	[Catalog_ModifiedOn] [datetime] not null,
	[Catalog_ModifiedBy] [uniqueidentifier] not null
)
')
go
 
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_PARAMETER                             *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [object_id] from sys.objects where [name] = 'Tb_Parameter' and [type] = 'U')
exec ('
create table [Sc_Setting].[Tb_Parameter]
(
	[Parameter_Id] [uniqueidentifier] not null,
	[Parameter_Name] [varchar](50) not null,
	[Parameter_Value] [varchar](50) not null,
	[Parameter_Type] [uniqueidentifier] not null,
	[Parameter_Separator] [varchar](50) not null,
	[Parameter_Application] [uniqueidentifier] not null,
	[Parameter_Status] [uniqueidentifier] not null,
	[Parameter_CreatedOn] [datetime] not null,
	[Parameter_CreatedBy] [uniqueidentifier] not null,
	[Parameter_ModifiedOn] [datetime] not null,
	[Parameter_ModifiedBy] [uniqueidentifier] not null
)
')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_FILE                                  *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [object_id] from sys.objects where [name] = 'Tb_File' and [type] = 'U')
exec ('
create table [Sc_Setting].[Tb_File]
(
	[File_Id] [uniqueidentifier] not null,
	[File_Name] [varchar](50) not null,
	[File_Extension] [uniqueidentifier] not null,
	[File_Previous] [uniqueidentifier] not null,
	[File_Encrypted] [varchar](max) not null,
	[File_ReferenceType] [uniqueidentifier] not null,
	[File_Reference] [uniqueidentifier] not null,
	[File_Application] [uniqueidentifier] not null,
	[File_Status] [uniqueidentifier] not null,
	[File_CreatedOn] [datetime] not null,
	[File_CreatedBy] [uniqueidentifier] not null,
	[File_ModifiedOn] [datetime] not null,
	[File_ModifiedBy] [uniqueidentifier] not null
)
')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_CONTACT                               *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
 
if not exists (select [object_id] from sys.objects where [name] = 'Tb_Contact' and [type] = 'U')
exec ('
create table [Sc_Setting].[Tb_Contact]
(
	[Contact_Id] [uniqueidentifier] not null,
	[Contact_Title] [varchar](50) not null,
	[Contact_Name] [varchar](50) not null,
	[Contact_Type] [uniqueidentifier] not null,
	[Contact_Value] [varchar](50) not null,
	[Contact_IsPrimary] [bit] not null,
	[Contact_ReferenceType] [uniqueidentifier] not null,
	[Contact_Reference] [uniqueidentifier] not null,
	[Contact_Application] [uniqueidentifier] not null,
	[Contact_Status] [uniqueidentifier] not null,
	[Contact_CreatedOn] [datetime] not null,
	[Contact_CreatedBy] [uniqueidentifier] not null,
	[Contact_ModifiedOn] [datetime] not null,
	[Contact_ModifiedBy] [uniqueidentifier] not null
)
')
go
 
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_COMMENT                               *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
 
if not exists (select [object_id] from sys.objects where [name] = 'Tb_Comment' and [type] = 'U')
exec ('
create table [Sc_Setting].[Tb_Comment]
(
	[Comment_Id] [uniqueidentifier] not null,
	[Comment_Value] [varchar](500) not null,
	[Comment_RespondingTo] [uniqueidentifier] not null,
	[Comment_ReferenceType] [uniqueidentifier] not null,
	[Comment_Reference] [uniqueidentifier] not null,
	[Comment_Application] [uniqueidentifier] not null,
	[Comment_Status] [uniqueidentifier] not null,
	[Comment_CreatedOn] [datetime] not null,
	[Comment_CreatedBy] [uniqueidentifier] not null,
	[Comment_ModifiedOn] [datetime] not null,
	[Comment_ModifiedBy] [uniqueidentifier] not null
)
')
go
 
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_ADDRESS                               *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
 
if not exists (select [object_id] from sys.objects where [name] = 'Tb_Address' and [type] = 'U')
exec ('
create table [Sc_Setting].[Tb_Address]
(
	[Address_Id] [uniqueidentifier] not null,
	[Address_Street] [varchar](100) not null,
	[Address_Number] [varchar](20) not null,
	[Address_Unit] [varchar](20) not null,
	[Address_Neighborhood] [varchar](50) not null,
	[Address_City] [uniqueidentifier] not null,
	[Address_State] [uniqueidentifier] not null,
	[Address_Country] [uniqueidentifier] not null,
	[Address_PostalCode] [int] not null,
	[Address_IsCurrent] [bit] not null,
	[Address_ReferenceType] [uniqueidentifier] not null,
	[Address_Reference] [uniqueidentifier] not null,
	[Address_Application] [uniqueidentifier] not null,
	[Address_Status] [uniqueidentifier] not null,
	[Address_CreatedOn] [datetime] not null,
	[Address_CreatedBy] [uniqueidentifier] not null,
	[Address_ModifiedOn] [datetime] not null,
	[Address_ModifiedBy] [uniqueidentifier] not null
)
')
go
 
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_MODULE                                *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
 
if not exists (select [object_id] from sys.objects where [name] = 'Tb_Module' and [type] = 'U')
exec ('
create table [Sc_Setting].[Tb_Module]
(
	[Module_Id] [uniqueidentifier] not null,
	[Module_Name] [varchar](50) not null,
	[Module_Description] [varchar](200) not null,
	[Module_Application] [uniqueidentifier] not null,
	[Module_Status] [uniqueidentifier] not null,
	[Module_CreatedOn] [datetime] not null,
	[Module_CreatedBy] [uniqueidentifier] not null,
	[Module_ModifiedOn] [datetime] not null,
	[Module_ModifiedBy] [uniqueidentifier] not null
)
')
go
 
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_MENU                                  *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
 
if not exists (select [object_id] from sys.objects where [name] = 'Tb_Menu' and [type] = 'U')
exec ('
create table [Sc_Setting].[Tb_Menu]
(
	[Menu_Id] [uniqueidentifier] not null,
	[Menu_Name] [varchar](50) not null,
	[Menu_URL] [varchar](200) not null,
	[Menu_Level] [int] not null,
	[Menu_Order] [int] not null,
	[Menu_Icon] [uniqueidentifier] not null,
	[Menu_Parent] [uniqueidentifier] not null,
	[Menu_Module] [uniqueidentifier] not null,
	[Menu_Application] [uniqueidentifier] not null,
	[Menu_Status] [uniqueidentifier] not null,
	[Menu_CreatedOn] [datetime] not null,
	[Menu_CreatedBy] [uniqueidentifier] not null,
	[Menu_ModifiedOn] [datetime] not null,
	[Menu_ModifiedBy] [uniqueidentifier] not null
)
')
go
 
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_CONVERSATION                          *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
 
if not exists (select [object_id] from sys.objects where [name] = 'Tb_Conversation' and [type] = 'U')
exec ('
create table [Sc_Setting].[Tb_Conversation]
(
	[Conversation_Id] [uniqueidentifier] not null,
	[Conversation_Name] [varchar](50) not null,
	[Conversation_Type] [uniqueidentifier] not null,
	[Conversation_Image] [uniqueidentifier] not null,
	[Conversation_Admin] [uniqueidentifier] not null,
	[Conversation_Application] [uniqueidentifier] not null,
	[Conversation_Status] [uniqueidentifier] not null,
	[Conversation_CreatedOn] [datetime] not null,
	[Conversation_CreatedBy] [uniqueidentifier] not null,
	[Conversation_ModifiedOn] [datetime] not null,
	[Conversation_ModifiedBy] [uniqueidentifier] not null
)
')
go
 
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_PARTICIPANT                           *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
 
if not exists (select [object_id] from sys.objects where [name] = 'Tb_Participant' and [type] = 'U')
exec ('
create table [Sc_Setting].[Tb_Participant]
(
	[Participant_Id] [uniqueidentifier] not null,
	[Participant_Conversation] [uniqueidentifier] not null,
	[Participant_User] [uniqueidentifier] not null,
	[Participant_JoinedAt] [datetime] not null,
	[Participant_LastRead] [datetime] not null,
	[Participant_Application] [uniqueidentifier] not null,
	[Participant_Status] [uniqueidentifier] not null,
	[Participant_CreatedOn] [datetime] not null,
	[Participant_CreatedBy] [uniqueidentifier] not null,
	[Participant_ModifiedOn] [datetime] not null,
	[Participant_ModifiedBy] [uniqueidentifier] not null
)
')
go
 
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_MESSAGE                               *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
 
if not exists (select [object_id] from sys.objects where [name] = 'Tb_Message' and [type] = 'U')
exec ('
create table [Sc_Setting].[Tb_Message]
(
	[Message_Id] [uniqueidentifier] not null,
	[Message_Content] [varchar](500) not null,
	[Message_Sender] [uniqueidentifier] not null,
	[Message_Conversation] [uniqueidentifier] not null,
	[Message_Timestamp] [datetime] not null,
	[Message_Application] [uniqueidentifier] not null,
	[Message_Status] [uniqueidentifier] not null,
	[Message_CreatedOn] [datetime] not null,
	[Message_CreatedBy] [uniqueidentifier] not null,
	[Message_ModifiedOn] [datetime] not null,
	[Message_ModifiedBy] [uniqueidentifier] not null
)
')
go
 
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_NOTIFICATION                          *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [object_id] from sys.objects where [name] = 'Tb_Notification' and [type] = 'U')
exec ('
create table [Sc_Setting].[Tb_Notification]
(
	[Notification_Id] [uniqueidentifier] not null,
	[Notification_Title] [varchar](50) not null,
	[Notification_Content] [varchar](250) not null,
	[Notification_Type] [uniqueidentifier] not null,
	[Notification_Timestamp] [datetime] not null,
	[Notification_Recipient] [uniqueidentifier] not null,
	[Notification_Application] [uniqueidentifier] not null,
	[Notification_Status] [uniqueidentifier] not null,
	[Notification_CreatedOn] [datetime] not null,
	[Notification_CreatedBy] [uniqueidentifier] not null,
	[Notification_ModifiedOn] [datetime] not null,
	[Notification_ModifiedBy] [uniqueidentifier] not null
)
')
go
 
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_EMAIL                                 *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
 
if not exists (select [object_id] from sys.objects where [name] = 'Tb_Email' and [type] = 'U')
exec ('
create table [Sc_Setting].[Tb_Email]
(
	[Email_Id] [uniqueidentifier] not null,
	[Email_Subject] [varchar](50) not null,
	[Email_Content] [varchar](max) not null,
	[Email_Type] [uniqueidentifier] not null,
	[Email_Timestamp] [datetime] not null,
	[Email_Recipient] [uniqueidentifier] not null,
	[Email_Application] [uniqueidentifier] not null,
	[Email_Status] [uniqueidentifier] not null,
	[Email_CreatedOn] [datetime] not null,
	[Email_CreatedBy] [uniqueidentifier] not null,
	[Email_ModifiedOn] [datetime] not null,
	[Email_ModifiedBy] [uniqueidentifier] not null
)
')
go
 
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_PERIOD                                *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [object_id] from sys.objects where [name] = 'Tb_Period' and [type] = 'U')
exec ('
create table [Sc_Setting].[Tb_Period]
(
	[Period_Id] [uniqueidentifier] not null,
	[Period_Name] [varchar](100) not null,
	[Period_StartDate] [datetime] not null,
	[Period_EndDate] [datetime] not null,
	[Period_Application] [uniqueidentifier] not null,
	[Period_Status] [uniqueidentifier] not null,
	[Period_CreatedOn] [datetime] not null,
	[Period_CreatedBy] [uniqueidentifier] not null,
	[Period_ModifiedOn] [datetime] not null,
	[Period_ModifiedBy] [uniqueidentifier] not null
)
')
go
 
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_APPROVAL                              *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [object_id] from sys.objects where [name] = 'Tb_Approval' and [type] = 'U')
exec ('
create table [Sc_Setting].[Tb_Approval]
(
	[Approval_Id] [uniqueidentifier] not null,
	[Approval_ReferenceBy] [uniqueidentifier] not null,
	[Approval_By] [uniqueidentifier] not null,
	[Approval_Datetime] [datetime] not null,
	[Approval_Reaction] [uniqueidentifier] not null,
	[Approval_ReferenceAbout] [uniqueidentifier] not null,
	[Approval_About] [uniqueidentifier] not null,
	[Approval_Application] [uniqueidentifier] not null,
	[Approval_Status] [uniqueidentifier] not null,
	[Approval_CreatedOn] [datetime] not null,
	[Approval_CreatedBy] [uniqueidentifier] not null,
	[Approval_ModifiedOn] [datetime] not null,
	[Approval_ModifiedBy] [uniqueidentifier] not null
)
')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DEL ESQUEMA SC_SECURITY                              *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [schema_id] from [sys].[schemas] where [name] = 'Sc_Security')
exec ('create schema [Sc_Security]')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_USER                                  *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
 
if not exists (select [object_id] from sys.objects where [name] = 'Tb_User' and [type] = 'U')
exec ('
create table [Sc_Security].[Tb_User]
(
	[User_Id] [uniqueidentifier] not null,
	[User_Name] [varchar](50) not null,
	[User_Email] [varchar](100) not null,
	[User_Password] [varchar](20) not null,
	[User_LastLogin] [datetime] not null,
	[User_ResetPassword] [bit] not null,
	[User_Status] [uniqueidentifier] not null,
	[User_Application] [uniqueidentifier] not null,
	[User_CreatedOn] [datetime] not null,
	[User_CreatedBy] [uniqueidentifier] not null,
	[User_ModifiedOn] [datetime] not null,
	[User_ModifiedBy] [uniqueidentifier] not null
)
')
go
 
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_ROLE                                  *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [object_id] from sys.objects where [name] = 'Tb_Role' and [type] = 'U')
exec ('
create table [Sc_Security].[Tb_Role]
(
	[Role_Id] [uniqueidentifier] not null,
	[Role_Name] [varchar](50) not null,
	[Role_Description] [varchar](200) not null,
	[Role_Avatar] [uniqueidentifier] not null,
	[Role_Application] [uniqueidentifier] not null,
	[Role_Status] [uniqueidentifier] not null,
	[Role_CreatedOn] [datetime] not null,
	[Role_CreatedBy] [uniqueidentifier] not null,
	[Role_ModifiedOn] [datetime] not null,
	[Role_ModifiedBy] [uniqueidentifier] not null
)
')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_ACCESS                                *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [object_id] from sys.objects where [name] = 'Tb_Access' and [type] = 'U')
exec ('
create table [Sc_Security].[Tb_Access]
(
	[Access_User] [uniqueidentifier] not null,
	[Access_Role] [uniqueidentifier] not null,
	[Access_Application] [uniqueidentifier] not null,
	[Access_Status] [uniqueidentifier] not null,
	[Access_CreatedOn] [datetime] not null,
	[Access_CreatedBy] [uniqueidentifier] not null,
	[Access_ModifiedOn] [datetime] not null,
	[Access_ModifiedBy] [uniqueidentifier] not null
)
')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_MEMBERSHIP                            *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [object_id] from sys.objects where [name] = 'Tb_Membership' and [type] = 'U')
exec ('
create table [Sc_Security].[Tb_Membership]
(
	[Membership_User] [uniqueidentifier] not null,
	[Membership_Enterprise] [uniqueidentifier] not null,
	[Membership_Application] [uniqueidentifier] not null,
	[Membership_Status] [uniqueidentifier] not null,
	[Membership_CreatedOn] [datetime] not null,
	[Membership_CreatedBy] [uniqueidentifier] not null,
	[Membership_ModifiedOn] [datetime] not null,
	[Membership_ModifiedBy] [uniqueidentifier] not null
)
')
go
 
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_PERMISSION                            *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [object_id] from sys.objects where [name] = 'Tb_Permission' and [type] = 'U')
exec ('
create table [Sc_Security].[Tb_Permission]
(
	[Permission_Action] [uniqueidentifier] not null,
	[Permission_Role] [uniqueidentifier] not null,
	[Permission_Application] [uniqueidentifier] not null,
	[Permission_Status] [uniqueidentifier] not null,
	[Permission_CreatedOn] [datetime] not null,
	[Permission_CreatedBy] [uniqueidentifier] not null,
	[Permission_ModifiedOn] [datetime] not null,
	[Permission_ModifiedBy] [uniqueidentifier] not null
)
')
go
 
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_LOG                                   *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [object_id] from sys.objects where [name] = 'Tb_Log' and [type] = 'U')
exec ('
create table [Sc_Security].[Tb_Log]
(
	[Log_Id] [uniqueidentifier] not null,
	[Log_Timestamp] [datetime] not null,
	[Log_Type] [uniqueidentifier] not null,
	[Log_Message] [varchar](100) not null,
	[Log_Detail] [varchar](100) not null,
	[Log_ReferenceType] [uniqueidentifier] not null,
	[Log_Reference] [uniqueidentifier] not null,
	[Log_Action] [uniqueidentifier] not null,
	[Log_ActionUser] [uniqueidentifier] not null,
	[Log_Application] [uniqueidentifier] not null,
	[Log_Status] [uniqueidentifier] not null,
	[Log_CreatedOn] [datetime] not null,
	[Log_CreatedBy] [uniqueidentifier] not null,
	[Log_ModifiedOn] [datetime] not null,
	[Log_ModifiedBy] [uniqueidentifier] not null
)
')
go
 
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_TOKEN                                 *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [object_id] from sys.objects where [name] = 'Tb_Token' and [type] = 'U')
exec ('
create table [Sc_Security].[Tb_Token]
(
	[Token_Id] [uniqueidentifier] not null,
	[Token_JWT] [varchar](max) not null,
	[Token_User] [uniqueidentifier] not null,
	[Token_Expiration] [datetime] not null,
	[Token_Application] [uniqueidentifier] not null,
	[Token_Status] [uniqueidentifier] not null,
	[Token_CreatedOn] [datetime] not null,
	[Token_CreatedBy] [uniqueidentifier] not null,
	[Token_ModifiedOn] [datetime] not null,
	[Token_ModifiedBy] [uniqueidentifier] not null
)
')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DEL ESQUEMA SC_RRHH                                  *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [schema_id] from [sys].[schemas] where [name] = 'Sc_RRHH')
exec ('create schema [Sc_RRHH]')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_EMPLOYEE                              *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [object_id] from sys.objects where [name] = 'Tb_Employee' and [type] = 'U')
exec ('
create table [Sc_RRHH].[Tb_Employee]
(
	[Employee_Id] [uniqueidentifier] not null,
	[Employee_FirstName] [varchar](100) not null,
	[Employee_LastName] [varchar](100) not null,
	[Employee_BirthDate] [datetime] not null,
	[Employee_BaseSalary] [decimal](10, 2) not null,
	[Employee_VacationDays] [int] not null,
	[Employee_VacationDaysTaken] [int] not null,
	[Employee_StartDate] [datetime] not null,
	[Employee_EndDate] [datetime] not null,
	[Employee_Schema] [uniqueidentifier] not null,
	[Employee_Level] [uniqueidentifier] not null,
	[Employee_Title] [uniqueidentifier] not null,
	[Employee_PayPeriodType] [uniqueidentifier] not null,
	[Employee_PayFrequency] [uniqueidentifier] not null,
	[Employee_Client] [uniqueidentifier] not null,
	[Employee_Department] [uniqueidentifier] not null,
	[Employee_ImmediateBoss] [uniqueidentifier] not null,
	[Employee_User] [uniqueidentifier] not null,
	[Employee_Application] [uniqueidentifier] not null,
	[Employee_Status] [uniqueidentifier] not null,
	[Employee_CreatedOn] [datetime] not null,
	[Employee_CreatedBy] [uniqueidentifier] not null,
	[Employee_ModifiedOn] [datetime] not null,
	[Employee_ModifiedBy] [uniqueidentifier] not null
)
')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_PERFORMANCE                           *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [object_id] from sys.objects where [name] = 'Tb_Performance' and [type] = 'U')
exec ('
create table [Sc_RRHH].[Tb_Performance]
(
	[Performance_Id] [uniqueidentifier] not null,
	[Performance_TargetValue] [decimal](10, 2) not null,
	[Performance_ActualValue] [decimal](10, 2) not null,
	[Performance_Feedback] [varchar](500) not null,
	[Performance_KPI] [uniqueidentifier] not null,
	[Performance_Period] [uniqueidentifier] not null,
	[Performance_Application] [uniqueidentifier] not null,
	[Performance_Status] [uniqueidentifier] not null,
	[Performance_CreatedOn] [datetime] not null,
	[Performance_CreatedBy] [uniqueidentifier] not null,
	[Performance_ModifiedOn] [datetime] not null,
	[Performance_ModifiedBy] [uniqueidentifier] not null
)
')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_SKILL                                 *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [object_id] from sys.objects where [name] = 'Tb_Skill' and [type] = 'U')
exec ('
create table [Sc_RRHH].[Tb_Skill]
(
	[Skill_Id] [uniqueidentifier] not null,
	[Skill_Technology] [uniqueidentifier] not null,
	[Skill_Level] [uniqueidentifier] not null,
	[Skill_Experience] [int] not null,
	[Skill_ExperienceUnit] [uniqueidentifier] not null,
	[Skill_ReferenceType] [uniqueidentifier] not null,
	[Skill_Reference] [uniqueidentifier] not null,
	[Skill_Application] [uniqueidentifier] not null,
	[Skill_Status] [uniqueidentifier] not null,
	[Skill_CreatedOn] [datetime] not null,
	[Skill_CreatedBy] [uniqueidentifier] not null,
	[Skill_ModifiedOn] [datetime] not null,
	[Skill_ModifiedBy] [uniqueidentifier] not null
)
')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_REQUESTDAY                            *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [object_id] from sys.objects where [name] = 'Tb_RequestDay' and [type] = 'U')
exec ('
create table [Sc_RRHH].[Tb_RequestDay]
(
	[RequestDay_Id] [uniqueidentifier] not null,
	[RequestDay_Type] [uniqueidentifier] not null,
	[RequestDay_StartDate] [date] not null,
	[RequestDay_EndDate] [date] not null,
	[RequestDay_ReturnDate] [date] not null,
	[RequestDay_RequestDate] [datetime] not null,
	[RequestDay_Employee] [uniqueidentifier] not null,
	[RequestDay_Application] [uniqueidentifier] not null,
	[RequestDay_Status] [uniqueidentifier] not null,
	[RequestDay_CreatedOn] [datetime] not null,
	[RequestDay_CreatedBy] [uniqueidentifier] not null,
	[RequestDay_ModifiedOn] [datetime] not null,
	[RequestDay_ModifiedBy] [uniqueidentifier] not null
)
')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DEL ESQUEMA SC_COMPANY                               *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [schema_id] from [sys].[schemas] where [name] = 'Sc_Company')
exec ('create schema [Sc_Company]')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_ENTERPRISE                            *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [object_id] from sys.objects where [name] = 'Tb_Enterprise' and [type] = 'U')
exec ('
create table [Sc_Company].[Tb_Enterprise]
(
	[Enterprise_Id] [uniqueidentifier] not null,
	[Enterprise_Name] [varchar](100) not null,
	[Enterprise_LegalName] [varchar](150) not null,
	[Enterprise_TaxpayerID] [varchar](20) not null,
	[Enterprise_Website] [varchar](250) not null,
	[Enterprise_Currency] [uniqueidentifier] not null,
	[Enterprise_Logo] [uniqueidentifier] not null,
	[Enterprise_Application] [uniqueidentifier] not null,
	[Enterprise_Status] [uniqueidentifier] not null,
	[Enterprise_CreatedOn] [datetime] not null,
	[Enterprise_CreatedBy] [uniqueidentifier] not null,
	[Enterprise_ModifiedOn] [datetime] not null,
	[Enterprise_ModifiedBy] [uniqueidentifier] not null
)
')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DEL TABLA SC_DEPARTMENT                              *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
 
if not exists (select [object_id] from sys.objects where [name] = 'Tb_Department' and [type] = 'U')
exec ('
create table [Sc_Company].[Tb_Department]
(
	[Department_Id] [uniqueidentifier] not null,
	[Department_Name] [varchar](50) not null,
	[Department_Description] [varchar](100) not null,
	[Department_Head] [uniqueidentifier] not null, 
	[Department_Enterprise] [uniqueidentifier] not null,
	[Department_Application] [uniqueidentifier] not null,
	[Department_Status] [uniqueidentifier] not null,
	[Department_CreatedOn] [datetime] not null,
	[Department_CreatedBy] [uniqueidentifier] not null,
	[Department_ModifiedOn] [datetime] not null,
	[Department_ModifiedBy] [uniqueidentifier] not null
)
')
go
 
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_PROJECT                               *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [object_id] from sys.objects where [name] = 'Tb_Project' and [type] = 'U')
exec ('
create table [Sc_Company].[Tb_Project]
(
	[Project_Id] [uniqueidentifier] not null,
	[Project_Name] [varchar](50) not null,
	[Project_Description] [varchar](100) not null,
	[Project_StartDate] [date] not null,
	[Project_EndDate] [date] not null,
	[Project_Client] [uniqueidentifier] not null,
	[Project_Department] [uniqueidentifier] not null,
	[Project_Application] [uniqueidentifier] not null,
	[Project_Status] [uniqueidentifier] not null,
	[Project_CreatedOn] [datetime] not null,
	[Project_CreatedBy] [uniqueidentifier] not null,
	[Project_ModifiedOn] [datetime] not null,
	[Project_ModifiedBy] [uniqueidentifier] not null
)
')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_WORKTEAM                              *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [object_id] from sys.objects where [name] = 'Tb_Workteam' and [type] = 'U')
exec ('
create table [Sc_Company].[Tb_Workteam]
(
	[Workteam_Id] [uniqueidentifier] not null,
	[Workteam_Name] [varchar](50) not null,
	[Workteam_Description] [varchar](100) not null,
	[Workteam_Project] [uniqueidentifier] not null,
	[Workteam_Application] [uniqueidentifier] not null,
	[Workteam_Status] [uniqueidentifier] not null,
	[Workteam_CreatedOn] [datetime] not null,
	[Workteam_CreatedBy] [uniqueidentifier] not null,
	[Workteam_ModifiedOn] [datetime] not null,
	[Workteam_ModifiedBy] [uniqueidentifier] not null
)
')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_MEMBER                                *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
 
if not exists (select [object_id] from sys.objects where [name] = 'Tb_Member' and [type] = 'U')
exec ('
create table [Sc_Company].[Tb_Member]
(
	[Member_Id] [uniqueidentifier] not null,
	[Member_Position] [uniqueidentifier] not null,
	[Member_Employee] [uniqueidentifier] not null,
	[Member_Workteam] [uniqueidentifier] not null,
	[Member_Application] [uniqueidentifier] not null,
	[Member_Status] [uniqueidentifier] not null,
	[Member_CreatedOn] [datetime] not null,
	[Member_CreatedBy] [uniqueidentifier] not null,
	[Member_ModifiedOn] [datetime] not null,
	[Member_ModifiedBy] [uniqueidentifier] not null
)
')
go
 
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA ESQUEMA SC_PAYROLL                             *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [schema_id] from [sys].[schemas] where [name] = 'Sc_Payroll')
exec ('create schema [Sc_Payroll]')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_PAYROLL                               *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [object_id] from sys.objects where [name] = 'Tb_Payroll' and [type] = 'U')
exec ('
create table [Sc_Payroll].[Tb_Payroll]
(
	[Payroll_Id] [uniqueidentifier] not null,
	[Payroll_Name] [varchar](100) not null,
	[Payroll_Period] [uniqueidentifier] not null,
	[Payroll_Schema] [uniqueidentifier] not null,
	[Payroll_Application] [uniqueidentifier] not null,
	[Payroll_Status] [uniqueidentifier] not null,
	[Payroll_CreatedOn] [datetime] not null,
	[Payroll_CreatedBy] [uniqueidentifier] not null,
	[Payroll_ModifiedOn] [datetime] not null,
	[Payroll_ModifiedBy] [uniqueidentifier] not null
)
')
go
 
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_EARNING                               *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
 
if not exists (select [object_id] from sys.objects where [name] = 'Tb_Earning' and [type] = 'U')
exec ('
create table [Sc_Payroll].[Tb_Earning]
(
	[Earning_Id] [uniqueidentifier] not null,
	[Earning_Name] [varchar](50) not null,
	[Earning_Formula] [varchar](100) not null,
	[Earning_Schema] [uniqueidentifier] not null,
	[Earning_Employee] [uniqueidentifier] not null,
	[Earning_Application] [uniqueidentifier] not null,
	[Earning_Status] [uniqueidentifier] not null,
	[Earning_CreatedOn] [datetime] not null,
	[Earning_CreatedBy] [uniqueidentifier] not null,
	[Earning_ModifiedOn] [datetime] not null,
	[Earning_ModifiedBy] [uniqueidentifier] not null
)
')
go
 
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_TRANSFER                              *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [object_id] from sys.objects where [name] = 'Tb_Transfer' and [type] = 'U')
exec ('
create table [Sc_Payroll].[Tb_Transfer]
(
	[Transfer_Id] [uniqueidentifier] not null,
	[Transfer_BaseSalary] [decimal](10, 2) not null,
	[Transfer_TotalEarnings] [decimal](10, 2) not null,
	[Transfer_TotalDeductions] [decimal](10, 2) not null,
	[Transfer_NetSalary] [decimal](10, 2) not null,
	[Transfer_Payroll] [uniqueidentifier] not null,
	[Transfer_Employee] [uniqueidentifier] not null,
	[Transfer_AccountBank]  [uniqueidentifier] not null,
	[Transfer_Application] [uniqueidentifier] not null,
	[Transfer_Status] [uniqueidentifier] not null,
	[Transfer_CreatedOn] [datetime] not null,
	[Transfer_CreatedBy] [uniqueidentifier] not null,
	[Transfer_ModifiedOn] [datetime] not null,
	[Transfer_ModifiedBy] [uniqueidentifier] not null
)
')
go
 
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_PAYOUT                                *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [object_id] from sys.objects where [name] = 'Tb_Payout' and [type] = 'U')
exec ('
create table [Sc_Payroll].[Tb_Payout]
(
	[Payout_Id] [uniqueidentifier] not null,
	[Payout_Amount] [decimal](10, 2) not null,
	[Payout_PayrollConcept] [uniqueidentifier] not null,
	[Payout_PayrollEmployee] [uniqueidentifier] not null,
	[Payout_Application] [uniqueidentifier] not null,
	[Payout_Status] [uniqueidentifier] not null,
	[Payout_CreatedOn] [datetime] not null,
	[Payout_CreatedBy] [uniqueidentifier] not null,
	[Payout_ModifiedOn] [datetime] not null,
	[Payout_ModifiedBy] [uniqueidentifier] not null
)
')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DEL ESQUEMA SC_RECRUIMENT                            *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [schema_id] from [sys].[schemas] where [name] = 'Sc_Recruitment')
exec ('create schema [Sc_Recruitment]')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_VACANCY                               *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [object_id] from sys.objects where [name] = 'Tb_Vacancy' and [type] = 'U')
exec ('
create table [Sc_Recruitment].[Tb_Vacancy]
(
	[Vacancy_Id] [uniqueidentifier] not null,
	[Vacancy_Client] [uniqueidentifier] not null,
	[Vacancy_Title] [varchar](50) not null,
	[Vacancy_Description] [varchar](100) not null,
	[Vacancy_Technology] [uniqueidentifier] not null,
	[Vacancy_Level] [uniqueidentifier] not null,
	[Vacancy_Experience] [int] not null,
	[Vacancy_ExperienceUnit] [uniqueidentifier] not null,
	[Vacancy_SalaryCap] [decimal](10, 2) not null,
	[Vacancy_Application] [uniqueidentifier] not null,
	[Vacancy_Status] [uniqueidentifier] not null,
	[Vacancy_CreatedOn] [datetime] not null,
	[Vacancy_CreatedBy] [uniqueidentifier] not null,
	[Vacancy_ModifiedOn] [datetime] not null,
	[Vacancy_ModifiedBy] [uniqueidentifier] not null
)
')
go
 
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_CANDIDATE                             *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [object_id] from sys.objects where [name] = 'Tb_Candidate' and [type] = 'U')
exec ('
create table [Sc_Recruitment].[Tb_Candidate]
(
	[Candidate_Id] [uniqueidentifier] not null,
	[Candidate_Vacancy] [uniqueidentifier] not null,
	[Candidate_FirstName] [varchar](100) not null,
	[Candidate_LastName] [varchar](100) not null,
	[Candidate_DegreeStudies] [uniqueidentifier] not null,
	[Candidate_WorkExperience] [int] not null,
	[Candidate_WorkExperienceUnit] [uniqueidentifier] not null,
	[Candidate_CurrentPosition] [varchar](50) not null,
	[Candidate_CurrentCompany] [varchar](50) not null,
	[Candidate_CurrentSalary] [decimal](10, 2) not null,
	[Candidate_ExpectedSalary] [decimal](10, 2) not null,
	[Candidate_Availability] [int] not null,
	[Candidate_AvailabilityUnit] [uniqueidentifier] not null,
	[Candidate_CV] [uniqueidentifier] not null,
	[Candidate_Application] [uniqueidentifier] not null,
	[Candidate_Status] [uniqueidentifier] not null,
	[Candidate_CreatedOn] [datetime] not null,
	[Candidate_CreatedBy] [uniqueidentifier] not null,
	[Candidate_ModifiedOn] [datetime] not null,
	[Candidate_ModifiedBy] [uniqueidentifier] not null
)
')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_INTERVIEW                             *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [object_id] from sys.objects where [name] = 'Tb_Interview' and [type] = 'U')
exec ('
create table [Sc_Recruitment].[Tb_Interview]
(
	[Interview_Id] [uniqueidentifier] not null,
	[Interview_Candidate] [uniqueidentifier] not null,
	[Interview_Interviewer] [uniqueidentifier] not null,
	[Interview_Datetime] [datetime] not null,
	[Interview_Application] [uniqueidentifier] not null,
	[Interview_Status] [uniqueidentifier] not null,
	[Interview_CreatedOn] [datetime] not null,
	[Interview_CreatedBy] [uniqueidentifier] not null,
	[Interview_ModifiedOn] [datetime] not null,
	[Interview_ModifiedBy] [uniqueidentifier] not null
)
')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DEL ESQUEMA SC_TRAKING                               *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [schema_id] from [sys].[schemas] where [name] = 'Sc_Traking')
exec ('create schema [Sc_Traking]')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_CLOCKIN                               *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [object_id] from sys.objects where [name] = 'Tb_Clockin' and [type] = 'U')
exec ('
create table [Sc_Traking].[Tb_Clockin]
(
	[Clockin_Id] [uniqueidentifier] not null,
	[Clockin_CheckIn] [datetime] not null,
	[Clockin_CheckOut] [datetime] not null,
	[Clockin_Period] [uniqueidentifier] not null,
	[Clockin_Employee] [uniqueidentifier] not null,
	[Clockin_Client] [uniqueidentifier] not null,
	[Clockin_Application] [uniqueidentifier] not null,
	[Clockin_Status] [uniqueidentifier] not null,
	[Clockin_CreatedOn] [datetime] not null,
	[Clockin_CreatedBy] [uniqueidentifier] not null,
	[Clockin_ModifiedOn] [datetime] not null,
	[Clockin_ModifiedBy] [uniqueidentifier] not null
)
')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_TIMESHEET                             *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [object_id] from sys.objects where [name] = 'Tb_Timesheet' and [type] = 'U')
exec ('
create table [Sc_Traking].[Tb_Timesheet]
(
	[Timesheet_Id] [uniqueidentifier] not null,
	[Timesheet_Hours] [decimal](3, 2) not null,
	[Timesheet_Description] [varchar](20) not null,
	[Timesheet_Deliberable] [varchar](50) not null,
	[Timesheet_DeliberableFile] [uniqueidentifier] not null,
	[Timesheet_Overtime] [bit] not null,
	[Timesheet_Clockin] [uniqueidentifier] not null,
	[Timesheet_Application] [uniqueidentifier] not null,
	[Timesheet_Status] [uniqueidentifier] not null,
	[Timesheet_CreatedOn] [datetime] not null,
	[Timesheet_CreatedBy] [uniqueidentifier] not null,
	[Timesheet_ModifiedOn] [datetime] not null,
	[Timesheet_ModifiedBy] [uniqueidentifier] not null
)
')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DEL ESQUEMA SC_TRAINING                              *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [schema_id] from [sys].[schemas] where [name] = 'Sc_Training')
exec ('create schema [Sc_Training]')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_COURSE                                *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [object_id] from sys.objects where [name] = 'Tb_Course' and [type] = 'U')
exec ('
create table [Sc_Training].[Tb_Course]
(
	[Course_Id] [uniqueidentifier] not null,
	[Course_Name] [varchar](50) not null,
	[Course_Description] [varchar](200) not null,
	[Course_StartDate] [datetime] not null,
	[Course_EndDate] [datetime] not null,
	[Course_Sessions] [int] not null,
	[Course_Application] [uniqueidentifier] not null,
	[Course_Status] [uniqueidentifier] not null,
	[Course_CreatedOn] [datetime] not null,
	[Course_CreatedBy] [uniqueidentifier] not null,
	[Course_ModifiedOn] [datetime] not null,
	[Course_ModifiedBy] [uniqueidentifier] not null
)
')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_INSCRIPTION                           *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [object_id] from sys.objects where [name] = 'Tb_Inscription' and [type] = 'U')
exec ('
create table [Sc_Training].[Tb_Inscription]
(
	[Inscription_Id] [uniqueidentifier] not null,
	[Inscription_User] [uniqueidentifier] not null,
	[Inscription_Course] [uniqueidentifier] not null,
	[Inscription_Date] [date] not null,
	[Inscription_Progress] [decimal](10, 2) not null,
	[Inscription_Application] [uniqueidentifier] not null,
	[Inscription_Status] [uniqueidentifier] not null,
	[Inscription_CreatedOn] [datetime] not null,
	[Inscription_CreatedBy] [uniqueidentifier] not null,
	[Inscription_ModifiedOn] [datetime] not null,
	[Inscription_ModifiedBy] [uniqueidentifier] not null
)
')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_SESSION                               *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [object_id] from sys.objects where [name] = 'Tb_Session' and [type] = 'U')
exec ('
create table [Sc_Training].[Tb_Session]
(
	[Session_Id] [uniqueidentifier] not null,
	[Session_Title] [varchar](50) not null,
	[Session_Description] [varchar](200) not null,
	[Session_Material] [uniqueidentifier] not null,
	[Session_Instructor] [uniqueidentifier] not null,
	[Session_StartDate] [datetime] not null,
	[Session_EndDate] [datetime] not null,
	[Session_Course] [uniqueidentifier] not null,
	[Session_Application] [uniqueidentifier] not null,
	[Session_Status] [uniqueidentifier] not null,
	[Session_CreatedOn] [datetime] not null,
	[Session_CreatedBy] [uniqueidentifier] not null,
	[Session_ModifiedOn] [datetime] not null,
	[Session_ModifiedBy] [uniqueidentifier] not null
)
')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_ATTENDANCE                            *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [object_id] from sys.objects where [name] = 'Tb_Attendance' and [type] = 'U')
exec ('
create table [Sc_Training].[Tb_Attendance]
(
	[Attendance_Id] [uniqueidentifier] not null,
	[Attendance_Session] [uniqueidentifier] not null,
	[Attendance_Inscription] [uniqueidentifier] not null,
	[Attendance_Application] [uniqueidentifier] not null,
	[Attendance_Status] [uniqueidentifier] not null,
	[Attendance_CreatedOn] [datetime] not null,
	[Attendance_CreatedBy] [uniqueidentifier] not null,
	[Attendance_ModifiedOn] [datetime] not null,
	[Attendance_ModifiedBy] [uniqueidentifier] not null
)
')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DEL ESQUEMA SC_FINANCE                               *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [schema_id] from [sys].[schemas] where [name] = 'Sc_Finance')
exec ('create schema [Sc_Finance]')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_COSTCENTER                            *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [object_id] from sys.objects where [name] = 'Tb_CostCenter' and [type] = 'U')
exec ('
create table [Sc_Finance].[Tb_CostCenter]
(
	[CostCenter_Id] [uniqueidentifier] not null,
	[CostCenter_Name] [varchar](50) not null,
	[CostCenter_Description] [varchar](100) not null,
	[CostCenter_Type] [uniqueidentifier] not null,
	[CostCenter_Department] [uniqueidentifier] not null,
	[CostCenter_Application] [uniqueidentifier] not null,
	[CostCenter_Status] [uniqueidentifier] not null,
	[CostCenter_CreatedOn] [datetime] not null,
	[CostCenter_CreatedBy] [uniqueidentifier] not null,
	[CostCenter_ModifiedOn] [datetime] not null,
	[CostCenter_ModifiedBy] [uniqueidentifier] not null
)
')
go
 
/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_BUDGET                                *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [object_id] from sys.objects where [name] = 'Tb_Budget' and [type] = 'U')
exec ('
create table [Sc_Finance].[Tb_Budget]
(
	[Budget_Id] [uniqueidentifier] not null,
	[Budget_Period] [uniqueidentifier] not null,
	[Budget_AllocatedAmount] [decimal](10, 2) not null,
	[Budget_AvailableAmount] [decimal](10, 2) not null,
	[Budget_Currency] [uniqueidentifier] not null,
	[Budget_CostCenter] [uniqueidentifier] not null,
	[Budget_Application] [uniqueidentifier] not null,
	[Budget_Status] [uniqueidentifier] not null,
	[Budget_CreatedOn] [datetime] not null,
	[Budget_CreatedBy] [uniqueidentifier] not null,
	[Budget_ModifiedOn] [datetime] not null,
	[Budget_ModifiedBy] [uniqueidentifier] not null
)
')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_EXPENSE                               *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [object_id] from sys.objects where [name] = 'Tb_Expense' and [type] = 'U')
exec ('
create table [Sc_Finance].[Tb_Expense]
(
	[Expense_Id] [uniqueidentifier] not null,
	[Expense_Date] [date] not null,
	[Expense_Amount] [decimal](10, 2) not null,
	[Expense_Currency] [uniqueidentifier] not null,
	[Expense_Invoice] [uniqueidentifier] not null,
	[Expense_CostCenter] [uniqueidentifier] not null,
	[Expense_Application] [uniqueidentifier] not null,
	[Expense_Status] [uniqueidentifier] not null,
	[Expense_CreatedOn] [datetime] not null,
	[Expense_CreatedBy] [uniqueidentifier] not null,
	[Expense_ModifiedOn] [datetime] not null,
	[Expense_ModifiedBy] [uniqueidentifier] not null
)
')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_EXPENSEITEM                            *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [object_id] from sys.objects where [name] = 'Tb_ExpenseItem' and [type] = 'U')
exec ('
create table [Sc_Finance].[Tb_ExpenseItem]
(
	[ExpenseItem_Id] [uniqueidentifier] not null,
	[ExpenseItem_Percentage] [decimal](5, 2) not null,
	[ExpenseItem_Amount] [decimal](10, 2) not null,
	[ExpenseItem_Department] [uniqueidentifier] not null,
	[ExpenseItem_Expence] [uniqueidentifier] not null,
	[ExpenseItem_Application] [uniqueidentifier] not null,
	[ExpenseItem_Status] [uniqueidentifier] not null,
	[ExpenseItem_CreatedOn] [datetime] not null,
	[ExpenseItem_CreatedBy] [uniqueidentifier] not null,
	[ExpenseItem_ModifiedOn] [datetime] not null,
	[ExpenseItem_ModifiedBy] [uniqueidentifier] not null
)
')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_PAYMENT                               *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [object_id] from sys.objects where [name] = 'Tb_Payment' and [type] = 'U')
exec ('
create table [Sc_Finance].[Tb_Payment]
(
	[Payment_Id] [uniqueidentifier] not null,
	[Payment_Description] [varchar](50) not null,
	[Payment_Reference] [varchar](100) not null,
	[Payment_Amount] [decimal](10, 2) not null,
	[Payment_Currency] [uniqueidentifier] not null,
	[Payment_Date] [date] not null,
	[Payment_Banking] [uniqueidentifier] not null,
	[Payment_Application] [uniqueidentifier] not null,
	[Payment_Status] [uniqueidentifier] not null,
	[Payment_CreatedOn] [datetime] not null,
	[Payment_CreatedBy] [uniqueidentifier] not null,
	[Payment_ModifiedOn] [datetime] not null,
	[Payment_ModifiedBy] [uniqueidentifier] not null
)
')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_ACCOUNT                               *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [object_id] from sys.objects where [name] = 'Tb_Account' and [type] = 'U')
exec ('
create table [Sc_Finance].[Tb_Account]
(
	[Account_Id] [uniqueidentifier] not null,
	[Account_Type] [uniqueidentifier] not null,
	[Account_Client] [uniqueidentifier] not null, 
	[Account_Supplier] [uniqueidentifier] not null,
	[Account_Invoice] [uniqueidentifier] not null,
	[Account_ExpirationDate] [date] not null,
	[Account_Amount] [decimal](10, 2) not null,
	[Account_Paid] [decimal](10, 2) not null,
	[Account_Currency] [uniqueidentifier] not null,
	[Account_Application] [uniqueidentifier] not null,
	[Account_Status] [uniqueidentifier] not null,
	[Account_CreatedOn] [datetime] not null,
	[Account_CreatedBy] [uniqueidentifier] not null,
	[Account_ModifiedOn] [datetime] not null,
	[Account_ModifiedBy] [uniqueidentifier] not null
)
')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_KARDEX                                *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [object_id] from sys.objects where [name] = 'Tb_Kardex' and [type] = 'U')
exec ('
create table [Sc_Finance].[Tb_Kardex]
(
	[Kardex_Id] [uniqueidentifier] not null,
	[Kardex_Concept] [varchar](50) not null,
	[Kardex_Account] [uniqueidentifier] not null,
	[Kardex_Date] [date] not null,
	[Kardex_Amount] [decimal](10, 2) not null,
	[Kardex_Application] [uniqueidentifier] not null,
	[Kardex_Status] [uniqueidentifier] not null,
	[Kardex_CreatedOn] [datetime] not null,
	[Kardex_CreatedBy] [uniqueidentifier] not null,
	[Kardex_ModifiedOn] [datetime] not null,
	[Kardex_ModifiedBy] [uniqueidentifier] not null
)
')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_BANKING                               *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [object_id] from sys.objects where [name] = 'Tb_Banking' and [type] = 'U')
exec ('
create table [Sc_Finance].[Tb_Banking]
(
	[Banking_Id] [uniqueidentifier] not null,
	[Banking_Number] [varchar](20) not null,
	[Banking_CardNumber] [varchar](20) not null,
	[Banking_RoutingNumber] [varchar](20) not null,
	[Banking_Bank] [uniqueidentifier] not null,
	[Banking_Reference] [uniqueidentifier] not null,
	[Banking_Application] [uniqueidentifier] not null,
	[Banking_Status] [uniqueidentifier] not null,
	[Banking_CreatedOn] [datetime] not null,
	[Banking_CreatedBy] [uniqueidentifier] not null,
	[Banking_ModifiedOn] [datetime] not null,
	[Banking_ModifiedBy] [uniqueidentifier] not null
)
')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_TRANSACTION                           *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [object_id] from sys.objects where [name] = 'Tb_Transaction' and [type] = 'U')
exec ('
create table [Sc_Finance].[Tb_Transaction]
(
	[Transaction_Id] [uniqueidentifier] not null,
	[Transaction_Banking] [uniqueidentifier] not null,
	[Transaction_Type] [uniqueidentifier] not null,
	[Transaction_Description] [varchar](20) not null,
	[Transaction_Date] [date] not null,
	[Transaction_Amount] [decimal](10, 2) not null,
	[Transaction_Currency] [uniqueidentifier] not null, 
	[Transaction_Application] [uniqueidentifier] not null,
	[Transaction_Status] [uniqueidentifier] not null,
	[Transaction_CreatedOn] [datetime] not null,
	[Transaction_CreatedBy] [uniqueidentifier] not null,
	[Transaction_ModifiedOn] [datetime] not null,
	[Transaction_ModifiedBy] [uniqueidentifier] not null
)
')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_INVOICE                               *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [object_id] from sys.objects where [name] = 'Tb_Invoice' and [type] = 'U')
exec ('
create table [Sc_Finance].[Tb_Invoice]
(
	[Invoice_Id] [uniqueidentifier] not null,
	[Invoice_Issuer] [uniqueidentifier] not null,
	[Invoice_Recipient] [uniqueidentifier] not null,
	[Invoice_Date] [date] not null,
	[Invoice_Amount] [decimal](10, 2) not null,
	[Invoice_Currency] [uniqueidentifier] not null,
	[Invoice_Application] [uniqueidentifier] not null,
	[Invoice_Status] [uniqueidentifier] not null,
	[Invoice_CreatedOn] [datetime] not null,
	[Invoice_CreatedBy] [uniqueidentifier] not null,
	[Invoice_ModifiedOn] [datetime] not null,
	[Invoice_ModifiedBy] [uniqueidentifier] not null
)
')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_INVOICEITEM                           *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [object_id] from sys.objects where [name] = 'Tb_InvoiceItem' and [type] = 'U')
exec ('
create table [Sc_Finance].[Tb_InvoiceItem]
(
	[InvoiceItem_Id] [uniqueidentifier] not null,
	[InvoiceItem_Item] [uniqueidentifier] not null,
	[InvoiceItem_Quantity] [int] not null,
	[InvoiceItem_UnitPrice] [decimal](10, 2) not null,
	[InvoiceItem_Amount] [decimal](10, 2) not null,
	[InvoiceItem_Invoice] [uniqueidentifier] not null,
	[InvoiceItem_Application] [uniqueidentifier] not null,
	[InvoiceItem_Status] [uniqueidentifier] not null,
	[InvoiceItem_CreatedOn] [datetime] not null,
	[InvoiceItem_CreatedBy] [uniqueidentifier] not null,
	[InvoiceItem_ModifiedOn] [datetime] not null,
	[InvoiceItem_ModifiedBy] [uniqueidentifier] not null
)
')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_PURCHASE                              *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [object_id] from sys.objects where [name] = 'Tb_Purchase' and [type] = 'U')
exec ('
create table [Sc_Finance].[Tb_Purchase]
(
	[Purchase_Id] [uniqueidentifier] not null,
	[Purchase_RequestDate] [date] not null,
	[Purchase_Description] [varchar](20) not null,
	[Purchase_Requester] [uniqueidentifier] not null,
	[Purchase_Date] [date] not null,
	[Purchase_Amount] [decimal](10, 2) not null,
	[Purchase_Currency] [uniqueidentifier] not null,
	[Purchase_Supplier] [uniqueidentifier] not null,
	[Purchase_Invoice] [uniqueidentifier] not null,
	[Purchase_Application] [uniqueidentifier] not null,
	[Purchase_Status] [uniqueidentifier] not null,
	[Purchase_CreatedOn] [datetime] not null,
	[Purchase_CreatedBy] [uniqueidentifier] not null,
	[Purchase_ModifiedOn] [datetime] not null,
	[Purchase_ModifiedBy] [uniqueidentifier] not null
)
')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_REFUND                                *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [object_id] from sys.objects where [name] = 'Tb_Refund' and [type] = 'U')
exec ('
create table [Sc_Finance].[Tb_Refund]
(
	[Refund_Id] [uniqueidentifier] not null,
	[Refund_Description] [varchar](50) not null,
	[Refund_Budget] [uniqueidentifier] not null,
	[Refund_Date] [date] not null,
	[Refund_Amount] [decimal](10, 2) not null,
	[Refund_Currency] [uniqueidentifier] not null,
	[Refund_Application] [uniqueidentifier] not null,
	[Refund_Status] [uniqueidentifier] not null,
	[Refund_CreatedOn] [datetime] not null,
	[Refund_CreatedBy] [uniqueidentifier] not null,
	[Refund_ModifiedOn] [datetime] not null,
	[Refund_ModifiedBy] [uniqueidentifier] not null
)
')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DEL ESQUEMA SC_COMMERCIAL                            *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [schema_id] from [sys].[schemas] where [name] = 'Sc_Commercial')
exec ('create schema [Sc_Commercial]')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_OFFER                                 *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [object_id] from sys.objects where [name] = 'Tb_Offer' and [type] = 'U')
exec ('
create table [Sc_Commercial].[Tb_Offer]
(
	[Offer_Id] [uniqueidentifier] not null,
	[Offer_Name] [varchar](50) not null,
	[Offer_Description] [varchar](200) not null,
	[Offer_Type] [uniqueidentifier] not null,
	[Offer_Price] [decimal](10, 2) not null,
	[Offer_Currency] [uniqueidentifier] not null,
	[Offer_Stock] [decimal](10, 2) not null,
	[Offer_Category] [uniqueidentifier] not null,
	[Offer_Image] [uniqueidentifier] not null,
	[Offer_Application] [uniqueidentifier] not null,
	[Offer_Status] [uniqueidentifier] not null,
	[Offer_CreatedOn] [datetime] not null,
	[Offer_CreatedBy] [uniqueidentifier] not null,
	[Offer_ModifiedOn] [datetime] not null,
	[Offer_ModifiedBy] [uniqueidentifier] not null
)
')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_CONTRACT                              *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [object_id] from sys.objects where [name] = 'Tb_Contract' and [type] = 'U')
exec ('
create table [Sc_Commercial].[Tb_Contract]
(
	[Contract_Id] [uniqueidentifier] not null,
	[Contract_Number] [varchar](50) not null,
	[Contract_Client] [uniqueidentifier] not null,
	[Contract_Supplier] [uniqueidentifier] not null,
	[Contract_SigningDate] [date] not null,
	[Contract_ExpirationDate] [date] not null,
	[Contract_Previus] [uniqueidentifier] not null,
	[Contract_Amount] [decimal](10, 2) not null,
	[Contract_Currency] [uniqueidentifier] not null,
	[Contract_File] [uniqueidentifier] not null,
	[Contract_Application] [uniqueidentifier] not null,
	[Contract_Status] [uniqueidentifier] not null,
	[Contract_CreatedOn] [datetime] not null,
	[Contract_CreatedBy] [uniqueidentifier] not null,
	[Contract_ModifiedOn] [datetime] not null,
	[Contract_ModifiedBy] [uniqueidentifier] not null
)
')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_ANNEXE                                *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [object_id] from sys.objects where [name] = 'Tb_Annexe' and [type] = 'U')
exec ('
create table [Sc_Commercial].[Tb_Annexe]
(
	[Annexe_Id] [uniqueidentifier] not null,
	[Annexe_Name] [varchar](50) not null,
	[Annexe_Contract] [uniqueidentifier] not null,
	[Annexe_Date] [date] not null,
	[Annexe_File] [uniqueidentifier] not null,
	[Annexe_Application] [uniqueidentifier] not null,
	[Annexe_Status] [uniqueidentifier] not null,
	[Annexe_CreatedOn] [datetime] not null,
	[Annexe_CreatedBy] [uniqueidentifier] not null,
	[Annexe_ModifiedOn] [datetime] not null,
	[Annexe_ModifiedBy] [uniqueidentifier] not null
)
')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_ANNEXEITEM                            *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [object_id] from sys.objects where [name] = 'Tb_AnnexeItem' and [type] = 'U')
exec ('
create table [Sc_Commercial].[Tb_AnnexeItem]
(
	[AnnexeItem_Id] [uniqueidentifier] not null,	
	[AnnexeItem_Quantity] [decimal](10, 2) not null,
	[AnnexeItem_Offer] [uniqueidentifier] not null,
	[AnnexeItem_UnitPrice] [decimal](10, 2) not null,
	[AnnexeItem_Date] [date] not null,
	[AnnexeItem_Amount] [decimal](10, 2) not null,
	[AnnexeItem_Currency] [uniqueidentifier] not null,
	[AnnexeItem_Annexe] [uniqueidentifier] not null,
	[AnnexeItem_Application] [uniqueidentifier] not null,
	[AnnexeItem_Status] [uniqueidentifier] not null,
	[AnnexeItem_CreatedOn] [datetime] not null,
	[AnnexeItem_CreatedBy] [uniqueidentifier] not null,
	[AnnexeItem_ModifiedOn] [datetime] not null,
	[AnnexeItem_ModifiedBy] [uniqueidentifier] not null
)
')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DEL ESQUEMA SC_CRM                                   *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [schema_id] from [sys].[schemas] where [name] = 'Sc_CRM')
exec ('create schema [Sc_CRM]')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_LEAD                                  *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [object_id] from sys.objects where [name] = 'Tb_Lead' and [type] = 'U')
exec ('
create table [Sc_CRM].[Tb_Lead]
(
	[Lead_Id] [uniqueidentifier] not null,
	[Lead_Enterprise] [uniqueidentifier] not null,
	[Lead_Contact] [uniqueidentifier] not null,
	[Lead_Description] [varchar](200) not null,
	[Lead_Estimated] [decimal](10, 2) not null,
	[Lead_Currency] [uniqueidentifier] not null,
	[Lead_Application] [uniqueidentifier] not null,
	[Lead_Status] [uniqueidentifier] not null,
	[Lead_CreatedOn] [datetime] not null,
	[Lead_CreatedBy] [uniqueidentifier] not null,
	[Lead_ModifiedOn] [datetime] not null,
	[Lead_ModifiedBy] [uniqueidentifier] not null
)
')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_ACTIVITY                              *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [object_id] from sys.objects where [name] = 'Tb_Activity' and [type] = 'U')
exec ('
create table [Sc_CRM].[Tb_Activity]
(
	[Activity_Id] [uniqueidentifier] not null,
	[Activity_Seller] [uniqueidentifier] not null,
	[Activity_Lead] [uniqueidentifier] not null,
	[Activity_Type] [uniqueidentifier] not null,
	[Activity_Note] [varchar](200) not null,
	[Activity_Application] [uniqueidentifier] not null,
	[Activity_Status] [uniqueidentifier] not null,
	[Activity_CreatedOn] [datetime] not null,
	[Activity_CreatedBy] [uniqueidentifier] not null,
	[Activity_ModifiedOn] [datetime] not null,
	[Activity_ModifiedBy] [uniqueidentifier] not null
)
')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_SALE                                  *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [object_id] from sys.objects where [name] = 'Tb_Sale' and [type] = 'U')
exec ('
create table [Sc_CRM].[Tb_Sale]
(
	[Sale_Id] [uniqueidentifier] not null,
	[Sale_Seller] [uniqueidentifier] not null,
	[Sale_Client] [uniqueidentifier] not null,
	[Sale_Date] [date] not null,
	[Sale_Amount] [decimal](10, 2) not null,
	[Sale_Currency] [uniqueidentifier] not null,
	[Sale_Lead] [uniqueidentifier] not null,
	[Sale_Contract] [uniqueidentifier] not null,
	[Sale_Application] [uniqueidentifier] not null,
	[Sale_Status] [uniqueidentifier] not null,
	[Sale_CreatedOn] [datetime] not null,
	[Sale_CreatedBy] [uniqueidentifier] not null,
	[Sale_ModifiedOn] [datetime] not null,
	[Sale_ModifiedBy] [uniqueidentifier] not null
)
')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_SALEITEM                              *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [object_id] from sys.objects where [name] = 'Tb_SaleItem' and [type] = 'U')
exec ('
create table [Sc_CRM].[Tb_SaleItem]
(
	[SaleItem_Id] [uniqueidentifier] not null,
	[SaleItem_Offer] [uniqueidentifier] not null,
	[SaleItem_Quantity] [decimal](10, 2) not null,
	[SaleItem_UnitPrice] [decimal](10, 2) not null,
	[SaleItem_Amount] [decimal](10, 2) not null,
	[SaleItem_Sale] [uniqueidentifier] not null,
	[SaleItem_Application] [uniqueidentifier] not null,
	[SaleItem_Status] [uniqueidentifier] not null,
	[SaleItem_CreatedOn] [datetime] not null,
	[SaleItem_CreatedBy] [uniqueidentifier] not null,
	[SaleItem_ModifiedOn] [datetime] not null,
	[SaleItem_ModifiedBy] [uniqueidentifier] not null
)
')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DEL ESQUEMA SC_SUPPORT                               *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [schema_id] from [sys].[schemas] where [name] = 'Sc_Support')
exec ('create schema [Sc_Support]')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_TICKET                                *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [object_id] from sys.objects where [name] = 'Tb_Ticket' and [type] = 'U')
exec ('
create table [Sc_Support].[Tb_Ticket]
(
	[Ticket_Id] [uniqueidentifier] not null,
	[Ticket_Title] [varchar](100) not null,
	[Ticket_Description] [varchar](max) not null,
	[Ticket_Priority] [uniqueidentifier] not null,
	[Ticket_Department] [uniqueidentifier] not null,
	[Ticket_Category] [uniqueidentifier] not null,
	[Ticket_Issue] [uniqueidentifier] not null,
	[Ticket_AssignedOn] [datetime] not null,
	[Ticket_AssignedTo] [uniqueidentifier] not null,
	[Ticket_ResolvedOn] [datetime] not null,
	[Ticket_ResolvedBy] [uniqueidentifier] not null,
	[Ticket_ClosedOn] [datetime] not null,
	[Ticket_ClosedBy] [uniqueidentifier] not null,
	[Ticket_ClosedReason] [uniqueidentifier] not null,
	[Ticket_Application] [uniqueidentifier] not null,
	[Ticket_Status] [uniqueidentifier] not null,
	[Ticket_CreatedOn] [datetime] not null,
	[Ticket_CreatedBy] [uniqueidentifier] not null,
	[Ticket_ModifiedOn] [datetime] not null,
	[Ticket_ModifiedBy] [uniqueidentifier] not null
)
')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_EQUIPMENT                             *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [object_id] from sys.objects where [name] = 'Tb_Equipment' and [type] = 'U')
exec ('
create table [Sc_Support].[Tb_Equipment]
(
	[Equipment_Id] [uniqueidentifier] not null,
	[Equipment_Description] [varchar](max) not null,
	[Equipment_Type] [uniqueidentifier] not null,
	[Equipment_Brand] [uniqueidentifier] not null,	
	[Equipment_Model] [varchar](200) not null,
	[Equipment_Serial] [varchar](50) not null,
	[Equipment_PurchaseDate] [date] not null,
	[Equipment_WarrantyExpiration] [datetime] not null,
	[Equipment_Supplier] [uniqueidentifier] not null,
	[Equipment_Location] [varchar](200) not null,
	[Equipment_Application] [uniqueidentifier] not null,
	[Equipment_Status] [uniqueidentifier] not null,
	[Equipment_CreatedOn] [datetime] not null,
	[Equipment_CreatedBy] [uniqueidentifier] not null,
	[Equipment_ModifiedOn] [datetime] not null,
	[Equipment_ModifiedBy] [uniqueidentifier] not null
)
')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CREACIÓN DE LA TABLA TB_ASSIGMENT                             *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists (select [object_id] from sys.objects where [name] = 'Tb_Assigment' and [type] = 'U')
exec ('
create table [Sc_Support].[Tb_Assigment]
(
	[Assigment_Employee] [uniqueidentifier] not null,
	[Assigment_Equipmet] [uniqueidentifier] not null,
	[Assigment_AssignedDate] [date] not null,
	[Assigment_ReturnDate] [date] not null,
	[Assigment_Document] [uniqueidentifier] not null,
	[Assigment_Application] [uniqueidentifier] not null,
	[Assigment_Status] [uniqueidentifier] not null,
	[Assigment_CreatedOn] [datetime] not null,
	[Assigment_CreatedBy] [uniqueidentifier] not null,
	[Assigment_ModifiedOn] [datetime] not null,
	[Assigment_ModifiedBy] [uniqueidentifier] not null
)
')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     INSERT INICIAL DE LA TABLA TB_APPLICATION                     *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */	

insert into [Sc_Setting].[Tb_Application]
(	
[Application_Id],
[Application_Name],
[Application_Icon],
[Application_Logo],
[Application_Banner],
[Application_CSS],
[Application_Status],
[Application_CreatedOn],
[Application_CreatedBy],
[Application_ModifiedOn],
[Application_ModifiedBy]
)
values
(
'00000000-0000-0000-0000-000000000000',
'',
'00000000-0000-0000-0000-000000000000',
'00000000-0000-0000-0000-000000000000',
'00000000-0000-0000-0000-000000000000',
'',
'00000000-0000-0000-0000-000000000000',
'1900-01-01',
'00000000-0000-0000-0000-000000000000',
'1900-01-01',
'00000000-0000-0000-0000-000000000000'
)

insert into [Sc_Setting].[Tb_Application]
(	
[Application_Id],
[Application_Name],
[Application_Icon],
[Application_Logo],
[Application_Banner],
[Application_CSS],
[Application_Status],
[Application_CreatedOn],
[Application_CreatedBy],
[Application_ModifiedOn],
[Application_ModifiedBy]
)
values
(
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'KERNEL_DEV_KSP',
'00000000-0000-0000-0000-000000000000',
'00000000-0000-0000-0000-000000000000',
'00000000-0000-0000-0000-000000000000',
'',
'95720BFB-D50F-4450-9C64-DE21A3F0AC3D',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     INSERT INICIAL DE LA TABLA TB_ENTITY                          *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */	

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'00000000-0000-0000-0000-000000000000',
'',
'00000000-0000-0000-0000-000000000000',
'00000000-0000-0000-0000-000000000000',
'00000000-0000-0000-0000-000000000000',
'1900-01-01',
'00000000-0000-0000-0000-000000000000',
'1900-01-01',
'00000000-0000-0000-0000-000000000000'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'465C1292-206B-4B68-A0F5-3BCBD4CFBE82',
'Tb_Account',
'92B783AD-10F5-4261-A4B0-9F538921B9B4',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'9DABBF1F-C3F6-487B-AE95-977E333DBA5E',
'Tb_Action',
'41DE36A5-1CF9-4176-83AA-92EE1FC045FE',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'7FBA3FDB-3FAA-4E7C-B9F6-06655E506D79',
'Tb_Activity',
'41DE36A5-1CF9-4176-83AA-92EE1FC045FE',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'26E771A5-7E31-4030-AE4B-96B9CE44C05B',
'Tb_Address',
'41DE36A5-1CF9-4176-83AA-92EE1FC045FE',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'3B53B18E-0C7B-4C21-924F-FE9893A6EE8E',
'Tb_Annexe',
'EB3B97D0-4686-4976-8C55-747EA6718518',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'BFF97C03-6380-4DF7-A863-C7DE564A9AC1',
'Tb_AnnexeItem',
'EB3B97D0-4686-4976-8C55-747EA6718518',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'6ED612F9-9AA4-49F8-9452-544E457EF407',
'Tb_Application',
'41DE36A5-1CF9-4176-83AA-92EE1FC045FE',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'E71C86FE-D75C-4B4E-89CF-854D3319DD8E',
'Tb_Approval',
'41DE36A5-1CF9-4176-83AA-92EE1FC045FE',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'15B6866D-6E1F-400E-A406-3B9F418B59A7',
'Tb_Assigment',
'1A8FC974-5F04-4665-B9EE-3CF71E16D5C0',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'22BA9CAA-E811-42DC-BB7F-2F016E47B799',
'Tb_Attendance',
'E89E3320-3471-44EE-8F82-353ADD73B7C4',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'F9EFF19B-D3D6-4E6F-8E59-D3FC9710A183',
'Tb_Banking',
'92B783AD-10F5-4261-A4B0-9F538921B9B4',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'642506F8-F816-496C-A0CD-A8BA1EC41055',
'Tb_Budget',
'92B783AD-10F5-4261-A4B0-9F538921B9B4',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'0264FDB1-BA4F-4CDF-B76D-247AA75DA298',
'Tb_Candidate',
'992910A1-1F04-4F9E-AAEB-22DCB64FC433',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'BF8398DB-118A-4F24-AC1F-859F0EA10AC7',
'Tb_Catalog',
'41DE36A5-1CF9-4176-83AA-92EE1FC045FE',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'859667C7-5C2C-4F64-84C3-E53ACEEC793A',
'Tb_Clockin',
'F3B91C87-A830-4ED4-A68E-D52495DADD32',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'2CFD6C41-0E2D-4211-A0CE-5893F3FC2727',
'Tb_Comment',
'41DE36A5-1CF9-4176-83AA-92EE1FC045FE',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'194F42BC-8389-4782-8E8D-7C5EE36885EC',
'Tb_Concept',
'41DE36A5-1CF9-4176-83AA-92EE1FC045FE',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'DD77F843-DDB2-41A8-9EF9-55E6128D2D52',
'Tb_Contact',
'41DE36A5-1CF9-4176-83AA-92EE1FC045FE',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'9BE33D1E-A5AF-459A-9F70-8CDF30C21C59',
'Tb_Contract',
'EB3B97D0-4686-4976-8C55-747EA6718518',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'D57EC0E6-B4F2-47CA-AC34-D3E8C02539A2',
'Tb_Conversation',
'41DE36A5-1CF9-4176-83AA-92EE1FC045FE',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'E69065BE-51B6-455F-891E-C65EA7023BE7',
'Tb_CostCenter',
'92B783AD-10F5-4261-A4B0-9F538921B9B4',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'DB804FC4-77F1-4E31-A867-25117E027260',
'Tb_Course',
'E89E3320-3471-44EE-8F82-353ADD73B7C4',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'B49A2F99-EA29-40D7-8739-6637D730EDAE',
'Tb_Department',
'CA534F01-16B5-4E6C-8BB6-C1D7BB70BF43',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'CA40CE81-3D1C-4FD8-A2AC-0C867AEA94EB',
'Tb_Email',
'41DE36A5-1CF9-4176-83AA-92EE1FC045FE',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'16185880-A00A-4208-8142-DB15297F2BB4',
'Tb_Employee',
'152170A3-A6E7-4BBA-949E-4782C64821B8',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'F93D880F-AAEF-4949-A500-E1918E8CB6A0',
'Tb_Enterprise',
'CA534F01-16B5-4E6C-8BB6-C1D7BB70BF43',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'9F8405B2-B1E8-410C-BD67-70AC99B17E8D',
'Tb_Entity',
'41DE36A5-1CF9-4176-83AA-92EE1FC045FE',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'1780D132-11C3-42B7-A4F7-416D5EE6E6DF',
'Tb_Equipment',
'1A8FC974-5F04-4665-B9EE-3CF71E16D5C0',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'7D2BE51A-5A97-4D8C-AD22-682A26E1A6F2',
'Tb_Expense',
'92B783AD-10F5-4261-A4B0-9F538921B9B4',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'4843E4D0-0BB4-484D-B631-224A023F4014',
'Tb_ExpenseItem',
'92B783AD-10F5-4261-A4B0-9F538921B9B4',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'019DFB04-44B7-4E7B-8F08-5BEA7C7CD840',
'Tb_File',
'41DE36A5-1CF9-4176-83AA-92EE1FC045FE',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'ABB469B5-5F84-4526-83D9-C110EEBD9A8C',
'Tb_Inscription',
'E89E3320-3471-44EE-8F82-353ADD73B7C4',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'5E35702C-1F02-4502-B532-410F8BB490F0',
'Tb_Interview',
'992910A1-1F04-4F9E-AAEB-22DCB64FC433',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'562ABE9F-19D2-4625-A7F8-15A05186C607',
'Tb_Invoice',
'92B783AD-10F5-4261-A4B0-9F538921B9B4',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'6AF0DF19-9456-4F8C-BCA1-0856DF730E64',
'Tb_InvoiceItem',
'92B783AD-10F5-4261-A4B0-9F538921B9B4',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'A7D79F20-C22E-4F95-B37F-DD19B115C55C',
'Tb_Kardex',
'92B783AD-10F5-4261-A4B0-9F538921B9B4',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'1A087244-EA28-4E0C-921E-89FCAD9CE2D9',
'Tb_Lead',
'D39BDED8-965F-44E5-8E64-3BDF7A7364A7',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'F4BCD6BB-D067-41E4-AF1E-F325FDA6A1BB',
'Tb_Log',
'63A1B26C-950D-4BD4-9926-E38C19E990D8',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'C2F31780-7B66-4D2F-9086-4FDEC1D1452C',
'Tb_Menu',
'41DE36A5-1CF9-4176-83AA-92EE1FC045FE',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'E2676AF4-22FD-4DA9-8D7F-271D5E26D145',
'Tb_Message',
'41DE36A5-1CF9-4176-83AA-92EE1FC045FE',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'D6A33546-74D0-4B9E-9CEF-AFA45D89DE85',
'Tb_Module',
'41DE36A5-1CF9-4176-83AA-92EE1FC045FE',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'923718EF-E932-4CA0-A757-0C924980D7A3',
'Tb_Notification',
'41DE36A5-1CF9-4176-83AA-92EE1FC045FE',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'FC3CA841-41D0-461C-B79A-DD61F2ACEF0A',
'Tb_Offer',
'EB3B97D0-4686-4976-8C55-747EA6718518',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'93A72171-6E8E-4B6E-8D1D-2957F0A1CDCD',
'Tb_Parameter',
'41DE36A5-1CF9-4176-83AA-92EE1FC045FE',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'0A152FF6-3355-4D2F-919D-C21AF57EBCC2',
'Tb_Participant',
'41DE36A5-1CF9-4176-83AA-92EE1FC045FE',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'94DC4E2A-B170-4383-8305-945CEFF9C3F5',
'Tb_Payment',
'92B783AD-10F5-4261-A4B0-9F538921B9B4',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'A72199CA-2DF1-46D6-BBCF-B453C31BB9DF',
'Tb_Payroll',
'723CDCF4-03F9-429E-B40E-19589F820F9C',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'64D954A9-71A6-419A-A088-6963244FB0DB',
'Tb_Earning',
'723CDCF4-03F9-429E-B40E-19589F820F9C',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'80D4DFA8-B33B-4831-BAD8-8943DA7241C9',
'Tb_Payout',
'723CDCF4-03F9-429E-B40E-19589F820F9C',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'4410E420-6E20-4F58-BE7B-BE15A4A42766',
'Tb_Tranfer',
'723CDCF4-03F9-429E-B40E-19589F820F9C',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'EA8969F4-EDAF-4C4A-997E-D03BB0BE6374',
'Tb_Performance',
'152170A3-A6E7-4BBA-949E-4782C64821B8',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'37E38302-24D4-42CA-8D6F-03E1A50563CE',
'Tb_Period',
'41DE36A5-1CF9-4176-83AA-92EE1FC045FE',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'78C0D76D-C025-4B63-B5D9-420675DC8BA9',
'Tb_Permission',
'63A1B26C-950D-4BD4-9926-E38C19E990D8',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'36BAAAD6-EF83-4CF4-80F6-06BB38CA95B3',
'Tb_Project',
'CA534F01-16B5-4E6C-8BB6-C1D7BB70BF43',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'9A4D90D8-714E-4487-B49F-FFB09FD9256E',
'Tb_Purchase',
'92B783AD-10F5-4261-A4B0-9F538921B9B4',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'55413ECC-A22C-4A6C-B9C7-A7DDB673A4E4',
'Tb_Refund',
'92B783AD-10F5-4261-A4B0-9F538921B9B4',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'354690C3-24F9-4534-BB1A-805E92C4CE6C',
'Tb_RequestDay',
'152170A3-A6E7-4BBA-949E-4782C64821B8',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'259260B1-AC2E-4528-947A-FCBEF129B49B',
'Tb_Role',
'63A1B26C-950D-4BD4-9926-E38C19E990D8',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'65CBAD7B-73A4-48B4-A97B-3626C6FDFF06',
'Tb_Sale',
'D39BDED8-965F-44E5-8E64-3BDF7A7364A7',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'BB5DBC9E-B9FE-4A3F-AEB0-D36FBA48F2D1',
'Tb_SaleItem',
'D39BDED8-965F-44E5-8E64-3BDF7A7364A7',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'0FD5CB91-95F0-4FB1-9EB3-0BDEE9D34EBA',
'Tb_Session',
'63A1B26C-950D-4BD4-9926-E38C19E990D8',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'6E20B2AC-841B-4516-8EEF-2BDB705CDF29',
'Tb_Skill',
'152170A3-A6E7-4BBA-949E-4782C64821B8',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'E9D3C7EA-C2D2-4D6D-9375-F858926249E6',
'Tb_Status',
'41DE36A5-1CF9-4176-83AA-92EE1FC045FE',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'609F8C76-A4C3-4519-898C-BBC653F6BDB0',
'Tb_Ticket',
'1A8FC974-5F04-4665-B9EE-3CF71E16D5C0',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'BE933D7C-F58D-4F2C-9824-BE58D4446D63',
'Tb_Timesheet',
'F3B91C87-A830-4ED4-A68E-D52495DADD32',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'6C84BF98-D5B1-4723-92E5-BD98F6F04C97',
'Tb_Token',
'63A1B26C-950D-4BD4-9926-E38C19E990D8',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'855530D0-4729-45CD-8F3A-485686BB7CA0',
'Tb_Transaction',
'92B783AD-10F5-4261-A4B0-9F538921B9B4',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'AC48BEBA-B1D3-49BA-936E-A9D7066E5509',
'Tb_User',
'63A1B26C-950D-4BD4-9926-E38C19E990D8',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'791C1E48-11AD-49B1-8426-6C444A4ABBFF',
'Tb_Membership',
'63A1B26C-950D-4BD4-9926-E38C19E990D8',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'3CCE17BF-1E34-4E3A-BB6D-DFB8C9497938',
'Tb_Access',
'63A1B26C-950D-4BD4-9926-E38C19E990D8',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'D727311A-90B9-4247-B197-ACFC4FEC24B9',
'Tb_Vacancy',
'992910A1-1F04-4F9E-AAEB-22DCB64FC433',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'A29FD878-B40A-4F34-AC95-321E6E9FEEA3',
'Tb_Workteam',
'CA534F01-16B5-4E6C-8BB6-C1D7BB70BF43',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Entity]
(
[Entity_Id],
[Entity_Value],
[Entity_Schema],
[Entity_Application],
[Entity_Status],
[Entity_CreatedOn],
[Entity_CreatedBy],
[Entity_ModifiedOn],
[Entity_ModifiedBy]
)
values
(
'4AEA5921-2B47-42A9-9148-82B742C498B5',
'Tb_Member',
'CA534F01-16B5-4E6C-8BB6-C1D7BB70BF43',
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     INSERT INICIAL DE LA TABLA TB_STATUS                          *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */	

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'00000000-0000-0000-0000-000000000000',
'00000000-0000-0000-0000-000000000000',
'',
0,
'00000000-0000-0000-0000-000000000000',
'00000000-0000-0000-0000-000000000000',
'2025-01-01',
'00000000-0000-0000-0000-000000000000',
'2025-01-01',
'00000000-0000-0000-0000-000000000000',
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'F7D7BA3E-F581-4673-8D8C-C3A7CDB690F6',
'6ED612F9-9AA4-49F8-9452-544E457EF407',
'Development',
1,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'ABBD45DD-4705-4471-8E8B-D08F16F876FD',
'6ED612F9-9AA4-49F8-9452-544E457EF407',
'Testing',
2,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'9D55012C-00F3-4AA6-9B34-300598C5562E',
'6ED612F9-9AA4-49F8-9452-544E457EF407',
'Pending Approval',
3,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'95720BFB-D50F-4450-9C64-DE21A3F0AC3D',
'6ED612F9-9AA4-49F8-9452-544E457EF407',
'Active',
4,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'C486D8B8-DCFA-4468-AEB8-B72E34856F9F',
'6ED612F9-9AA4-49F8-9452-544E457EF407',
'Maintenance',
5,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'0F26E8ED-DD4E-4209-A508-82911DEF533F',
'6ED612F9-9AA4-49F8-9452-544E457EF407',
'Inactive',
6,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'A071BE67-3A5C-496B-B023-699FE6F5BEF5',
'6ED612F9-9AA4-49F8-9452-544E457EF407',
'Deprecated',
7,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'23BA3E04-A2F5-4B8F-9C42-07EABA20BD3C',
'6ED612F9-9AA4-49F8-9452-544E457EF407',
'Archived',
8,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'C5BD4875-5C59-48B5-9B5E-49AE28FC58E6',
'6ED612F9-9AA4-49F8-9452-544E457EF407',
'Deleted',
9,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'9544EB0E-9258-4C2B-9EC6-DA937DA19A72',
'E9D3C7EA-C2D2-4D6D-9375-F858926249E6',
'Draft',
1,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'3FEB735F-475C-4517-A4A4-3BD7B83214D3',
'E9D3C7EA-C2D2-4D6D-9375-F858926249E6',
'Pending Approval',
2,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'E9D3C7EA-C2D2-4D6D-9375-F858926249E6',
'Active',
3,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'D4D231F8-6389-462C-86A6-8C66A3C9AD12',
'E9D3C7EA-C2D2-4D6D-9375-F858926249E6',
'Deprecated',
4,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'1B1BB780-EF5A-4840-96C9-EE5C3FE813C5',
'E9D3C7EA-C2D2-4D6D-9375-F858926249E6',
'Archived',
5,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'F4364951-ABE4-49A3-A944-AC4630EEAEB3',
'E9D3C7EA-C2D2-4D6D-9375-F858926249E6',
'Deleted',
6,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'B70E43F3-97BD-424D-B598-1E3973F7E4F9',
'9F8405B2-B1E8-410C-BD67-70AC99B17E8D',
'Defined',
1,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'D9720E74-5676-4ED9-8FB0-1A88D2E37A7A',
'9F8405B2-B1E8-410C-BD67-70AC99B17E8D',
'Initialized',
2,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'7A7AC4DB-4FA6-49CF-AB72-DBC3E25A7B76',
'9F8405B2-B1E8-410C-BD67-70AC99B17E8D',
'Active',
3,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'D9CA43EC-3821-4F7B-A15C-1AD6B2505EF5',
'9F8405B2-B1E8-410C-BD67-70AC99B17E8D',
'Inactive',
4,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'EC7AD986-7891-4BBB-A9B9-1196140213E9',
'9F8405B2-B1E8-410C-BD67-70AC99B17E8D',
'Deprecated',
5,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'F8CE5782-5437-4739-8AB1-834E6336FE9C',
'9F8405B2-B1E8-410C-BD67-70AC99B17E8D',
'Archived',
6,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'D4CAC5EC-F61A-4D83-8FA9-DDA5774306F9',
'9F8405B2-B1E8-410C-BD67-70AC99B17E8D',
'Deleted',
7,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'20EB4824-5F96-4256-BEC5-728BFD50EFEC',
'9DABBF1F-C3F6-487B-AE95-977E333DBA5E',
'Draft',
1,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'F7FF7C42-D235-4421-8870-64E9CFFBF3D8',
'9DABBF1F-C3F6-487B-AE95-977E333DBA5E',
'Pending Approval',
2,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'D8B11755-C2B5-4085-964A-F31EB42EE2C6',
'9DABBF1F-C3F6-487B-AE95-977E333DBA5E',
'Active',
3,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'C63258B3-D187-446F-8399-8D6986A4592B',
'9DABBF1F-C3F6-487B-AE95-977E333DBA5E',
'Inactive',
4,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'7EB6612B-4FB7-4808-9750-D0B31401DBC9',
'9DABBF1F-C3F6-487B-AE95-977E333DBA5E',
'Deprecated',
5,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'14664232-187C-495D-8C04-64A943B58A65',
'9DABBF1F-C3F6-487B-AE95-977E333DBA5E',
'Archived',
6,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'0536B77A-DAA7-4C7D-AB31-0A8F1085E6EE',
'9DABBF1F-C3F6-487B-AE95-977E333DBA5E',
'Deleted',
7,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'BFCB7717-1339-46F0-B84C-EAAC42590E8F',
'AC48BEBA-B1D3-49BA-936E-A9D7066E5509',
'Pending Activation',
1,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'7FD36BA4-4D7B-4FE1-BD1E-A3A1E8A6C2A2',
'AC48BEBA-B1D3-49BA-936E-A9D7066E5509',
'Active',
2,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'2ADF13AB-CB3C-49A6-B42A-AD21F8A9086A',
'AC48BEBA-B1D3-49BA-936E-A9D7066E5509',
'Suspended',
3,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'478C7C97-9DCD-4A6C-9EB0-12CECA92BD46',
'AC48BEBA-B1D3-49BA-936E-A9D7066E5509',
'Inactive',
4,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'77EC0F41-E85D-4944-935E-A417FA23A145',
'AC48BEBA-B1D3-49BA-936E-A9D7066E5509',
'Locked',
5,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'BF3912DF-3094-442B-AC70-34A21517D745',
'AC48BEBA-B1D3-49BA-936E-A9D7066E5509',
'Archived',
6,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'099AB3BC-9E99-414D-BB97-28FB02A465F3',
'AC48BEBA-B1D3-49BA-936E-A9D7066E5509',
'Deleted',
7,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'D54C3FE0-CDD4-4171-9D3B-0E2265D4AA99',
'194F42BC-8389-4782-8E8D-7C5EE36885EC',
'Draft',
1,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'5BD13E6F-AA49-4D92-B9F1-F44E29870225',
'194F42BC-8389-4782-8E8D-7C5EE36885EC',
'Pending Approval',
2,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'01FF312E-5536-4994-BF1E-0D7D0B8113E0',
'194F42BC-8389-4782-8E8D-7C5EE36885EC',
'Active',
3,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'597D24B5-488B-49FF-B308-3D2DE589D0A8',
'194F42BC-8389-4782-8E8D-7C5EE36885EC',
'Inactive',
4,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'73D2B8B4-4F6A-47A0-9257-1121D50134C3',
'194F42BC-8389-4782-8E8D-7C5EE36885EC',
'Deprecated',
5,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'147D403D-560A-4846-9E63-A97BC0CD32C0',
'194F42BC-8389-4782-8E8D-7C5EE36885EC',
'Archived',
6,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'77C05388-0A3D-47BF-9D29-636D85C8E60D',
'194F42BC-8389-4782-8E8D-7C5EE36885EC',
'Delete',
7,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'B97C4EF8-6802-4758-AD14-EEF4758BEC63',
'BF8398DB-118A-4F24-AC1F-859F0EA10AC7',
'Draft',
1,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'5E2784C8-5345-49AF-B611-0172B12AD4E0',
'BF8398DB-118A-4F24-AC1F-859F0EA10AC7',
'Pending Approval',
2,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'91F965C5-3327-4706-A7E7-19EB96587BE8',
'BF8398DB-118A-4F24-AC1F-859F0EA10AC7',
'Active',
3,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'6AFD76F5-BB6C-4999-B084-BD4B6CFD7426',
'BF8398DB-118A-4F24-AC1F-859F0EA10AC7',
'Inactive',
4,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'F12C97AC-37C5-4BA9-A91F-F6F0FB554F62',
'BF8398DB-118A-4F24-AC1F-859F0EA10AC7',
'Deprecated',
5,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'0E320CB5-95F1-40FB-8651-0B2EE8A2272C',
'BF8398DB-118A-4F24-AC1F-859F0EA10AC7',
'Archived',
6,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'96DF4841-551A-4BFF-A935-AF1960AF3826',
'BF8398DB-118A-4F24-AC1F-859F0EA10AC7',
'Deleted',
7,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'8E473A8D-3186-436D-84BE-0FB2D8C00F0C',
'93A72171-6E8E-4B6E-8D1D-2957F0A1CDCD',
'Draft',
1,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'F065F3E4-4FF6-4DB7-AF9F-710481796A43',
'93A72171-6E8E-4B6E-8D1D-2957F0A1CDCD',
'Pending Approval',
2,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'052B1065-1AA2-45B9-9DBE-90509CC79682',
'93A72171-6E8E-4B6E-8D1D-2957F0A1CDCD',
'Active',
3,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'5A730366-55B8-49CB-97E9-55373ADDF57F',
'93A72171-6E8E-4B6E-8D1D-2957F0A1CDCD',
'Inactive',
4,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'579D0802-31D2-418F-B1B3-A524B14A1C52',
'93A72171-6E8E-4B6E-8D1D-2957F0A1CDCD',
'Deprecated',
5,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'40F13BF3-0A87-4458-AE29-88B47A9DFACB',
'93A72171-6E8E-4B6E-8D1D-2957F0A1CDCD',
'Archived',
6,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'0D56F690-94CC-4453-9849-C402FA6E578E',
'93A72171-6E8E-4B6E-8D1D-2957F0A1CDCD',
'Deleted',
7,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'072B55B9-5303-4C6A-A7A6-78ED91C61F92',
'019DFB04-44B7-4E7B-8F08-5BEA7C7CD840',
'Uploaded',
1,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'6CEE7BD7-9DFD-43B3-BE5D-DEBAC2998E18',
'019DFB04-44B7-4E7B-8F08-5BEA7C7CD840',
'Processing',
2,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'BC970073-BEDD-4966-9443-0F736937D6C2',
'019DFB04-44B7-4E7B-8F08-5BEA7C7CD840',
'Processed',
3,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'FEA9FB62-EE32-4396-970C-FA5846901118',
'019DFB04-44B7-4E7B-8F08-5BEA7C7CD840',
'Active',
4,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'0ED8C5C3-2756-41C1-BAF7-7FE1299B18FE',
'019DFB04-44B7-4E7B-8F08-5BEA7C7CD840',
'Deprecated',
5,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'12F9C286-C1A3-4B81-8AAD-D636CF7277B3',
'019DFB04-44B7-4E7B-8F08-5BEA7C7CD840',
'Archived',
6,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'FE2A80B7-F1AC-4C9F-BCB7-F8D61357A747',
'019DFB04-44B7-4E7B-8F08-5BEA7C7CD840',
'Deleted',
7,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'6A686C1B-C8E6-4A13-8384-00E3A09F9241',
'DD77F843-DDB2-41A8-9EF9-55E6128D2D52',
'Draft',
1,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'E5725BC7-68C6-4D26-BC62-3C1806FD5F69',
'DD77F843-DDB2-41A8-9EF9-55E6128D2D52',
'Pending Approval',
2,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'B15EA317-3F01-4EB1-883E-50DBA8C3BF75',
'DD77F843-DDB2-41A8-9EF9-55E6128D2D52',
'Active',
3,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'22FE3D18-15E1-41F4-8B2E-8906F6E330BD',
'DD77F843-DDB2-41A8-9EF9-55E6128D2D52',
'Inactive',
4,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'7C15E47E-EB50-4C25-86D7-0FB64D67153B',
'DD77F843-DDB2-41A8-9EF9-55E6128D2D52',
'Blocked',
5,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'E0CC027D-4502-497F-863E-B08A3D547A85',
'DD77F843-DDB2-41A8-9EF9-55E6128D2D52',
'Archived',
6,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'0F95439E-5C19-482E-A8D2-DD74E980B7E0',
'DD77F843-DDB2-41A8-9EF9-55E6128D2D52',
'Deleted',
7,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'7BB775A6-DE96-4C13-AB7B-244147FFCDF1',
'2CFD6C41-0E2D-4211-A0CE-5893F3FC2727',
'Draft',
1,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'D6A7E0D4-270B-4C4C-A9D9-B1425C1C3C2D',
'2CFD6C41-0E2D-4211-A0CE-5893F3FC2727',
'Pending Approval',
2,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'6A2C146C-EC42-45A5-9467-CD3E22753CED',
'2CFD6C41-0E2D-4211-A0CE-5893F3FC2727',
'Published',
3,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'2F022874-AE76-48D8-8B67-A99DE865C309',
'2CFD6C41-0E2D-4211-A0CE-5893F3FC2727',
'Flagged',
4,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'B162CE68-E79F-4F09-84D4-C9799AC26EA5',
'2CFD6C41-0E2D-4211-A0CE-5893F3FC2727',
'Hidden',
5,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'A99B03A8-8060-479E-A4BC-7F4514D66FE8',
'2CFD6C41-0E2D-4211-A0CE-5893F3FC2727',
'Archived',
6,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'D1F60614-C184-4720-B6AE-B53CF6345767',
'2CFD6C41-0E2D-4211-A0CE-5893F3FC2727',
'Deleted',
7,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'BBCBA51C-30E1-46A9-8B23-95F214B683AF',
'26E771A5-7E31-4030-AE4B-96B9CE44C05B',
'Draft',
1,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'CE9D9C15-95DA-4347-83AB-5B7A2E3DA61D',
'26E771A5-7E31-4030-AE4B-96B9CE44C05B',
'Pending Approval',
2,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'525B9158-8B4A-4333-ABB0-E2FF54E8DF47',
'26E771A5-7E31-4030-AE4B-96B9CE44C05B',
'Active',
3,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'34622A0C-34C7-4359-A6F0-3305EF522AE7',
'26E771A5-7E31-4030-AE4B-96B9CE44C05B',
'Inactive',
4,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'B295BB13-E56D-496A-8353-E89C6E8BAD66',
'26E771A5-7E31-4030-AE4B-96B9CE44C05B',
'Deprecated',
5,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'B09078A7-0EEB-4B83-B615-0960C8DFFBE0',
'26E771A5-7E31-4030-AE4B-96B9CE44C05B',
'Archived',
6,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'E7D98A62-BC61-4373-BA05-8159EDF8EDF4',
'26E771A5-7E31-4030-AE4B-96B9CE44C05B',
'Deleted',
7,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'CD490899-7505-4051-B940-C685BD5F9DA2',
'D6A33546-74D0-4B9E-9CEF-AFA45D89DE85',
'Draft',
1,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'30EAE8BD-9D83-4774-94B3-7D9C86EF1033',
'D6A33546-74D0-4B9E-9CEF-AFA45D89DE85',
'Pending Approval',
2,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'24207A61-ECF9-4005-B679-5E40B9E097FA',
'D6A33546-74D0-4B9E-9CEF-AFA45D89DE85',
'Active',
3,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'2DABBC71-C5FF-4004-B3FA-574C83422D13',
'D6A33546-74D0-4B9E-9CEF-AFA45D89DE85',
'Inactive',
4,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'9036AF5A-05F0-4559-9113-996E784A48A2',
'D6A33546-74D0-4B9E-9CEF-AFA45D89DE85',
'Deprecated',
5,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'33337E3C-C19F-4CD9-8998-C7257F603B4F',
'D6A33546-74D0-4B9E-9CEF-AFA45D89DE85',
'Archived',
6,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'51E76771-AAEC-4415-9157-F4842DF01B8D',
'D6A33546-74D0-4B9E-9CEF-AFA45D89DE85',
'Deleted',
7,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'327CEA2E-BA66-4467-8C85-0D368BAC7662',
'C2F31780-7B66-4D2F-9086-4FDEC1D1452C',
'Draft',
1,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'62C183F0-06C0-428A-8933-7D7534D08AF1',
'C2F31780-7B66-4D2F-9086-4FDEC1D1452C',
'Pending Approval',
2,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'8BB8905B-37C4-457C-87B5-FBD4EAC8CB67',
'C2F31780-7B66-4D2F-9086-4FDEC1D1452C',
'Active',
3,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'A34776AD-B6C8-4F7A-8930-DF703A6787C5',
'C2F31780-7B66-4D2F-9086-4FDEC1D1452C',
'Inactive',
4,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'7DF7F59D-E75D-43B4-8261-7979491A4EA4',
'C2F31780-7B66-4D2F-9086-4FDEC1D1452C',
'Deprecated',
5,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'4CF888CD-28E1-45F9-BE33-5455C3778F1C',
'C2F31780-7B66-4D2F-9086-4FDEC1D1452C',
'Archived',
6,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'80FF4F51-41CC-4722-A574-C97CA2C2C2BB',
'C2F31780-7B66-4D2F-9086-4FDEC1D1452C',
'Deleted',
7,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'EA9D046E-C8B0-4C6B-BA9A-8B1F413BA798',
'D57EC0E6-B4F2-47CA-AC34-D3E8C02539A2',
'Open',
1,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'5C9B4899-D658-4701-B587-0F63DA02FD0D',
'D57EC0E6-B4F2-47CA-AC34-D3E8C02539A2',
'Pending',
2,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'CCD06DD0-7F7D-41BD-9248-0898152A0BD4',
'D57EC0E6-B4F2-47CA-AC34-D3E8C02539A2',
'Read',
3,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'AE06A835-85AC-44E0-BFF1-40035CDE72BC',
'D57EC0E6-B4F2-47CA-AC34-D3E8C02539A2',
'Idle',
4,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'8D06468B-86FA-4F1F-A696-67DA6E12AACE',
'D57EC0E6-B4F2-47CA-AC34-D3E8C02539A2',
'Closed',
5,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'CA5D47A1-6C6A-4CBD-81FC-EC26AAEF9C65',
'D57EC0E6-B4F2-47CA-AC34-D3E8C02539A2',
'Archived',
6,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'709311B9-3C60-40C4-BB29-AED37919E716',
'D57EC0E6-B4F2-47CA-AC34-D3E8C02539A2',
'Deleted',
7,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'EAF2FC2A-4423-4B03-A787-BF53109C33F5',
'0A152FF6-3355-4D2F-919D-C21AF57EBCC2',
'Joined',
1,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'3153529C-1970-4566-AEF7-DDE078AB2C61',
'0A152FF6-3355-4D2F-919D-C21AF57EBCC2',
'Typing',
2,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'A4008399-8C6D-4CB9-9CA9-4D27F1C46E69',
'0A152FF6-3355-4D2F-919D-C21AF57EBCC2',
'Idle',
3,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'1D40B7ED-A6C4-4A89-AD4A-10AFDC919367',
'0A152FF6-3355-4D2F-919D-C21AF57EBCC2',
'Left',
4,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'3B937A75-288F-4944-81EF-4F298B198091',
'0A152FF6-3355-4D2F-919D-C21AF57EBCC2',
'Removed',
5,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'3323DA5C-A647-45E7-A017-48E63DF77D13',
'0A152FF6-3355-4D2F-919D-C21AF57EBCC2',
'Archived',
6,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'C05483B9-83EC-4004-ADE3-0B355B8E20ED',
'0A152FF6-3355-4D2F-919D-C21AF57EBCC2',
'Deleted',
7,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'27906846-A917-4F8B-9528-11A4C69F3033',
'E2676AF4-22FD-4DA9-8D7F-271D5E26D145',
'Draft',
1,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'56856176-6EA8-4705-BADF-6558CD020D74',
'E2676AF4-22FD-4DA9-8D7F-271D5E26D145',
'Sent',
2,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'DAD6C971-A825-4412-A54E-A44FE65FA6C1',
'E2676AF4-22FD-4DA9-8D7F-271D5E26D145',
'Delivered',
3,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'C587C5D1-909C-4B51-A001-79EF7D426A27',
'E2676AF4-22FD-4DA9-8D7F-271D5E26D145',
'Read',
4,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'FA4FDF26-49CB-4A8B-B6D9-50AEE3DF356F',
'E2676AF4-22FD-4DA9-8D7F-271D5E26D145',
'Edited',
5,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'AB95F483-124B-4D91-B20B-C813FBA5CC5C',
'E2676AF4-22FD-4DA9-8D7F-271D5E26D145',
'Archived',
6,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'0A5B9976-108D-42DA-80D8-4E4A30E1F010',
'E2676AF4-22FD-4DA9-8D7F-271D5E26D145',
'Deleted',
7,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'789150B2-9944-46F0-8B68-69E75384E40C',
'923718EF-E932-4CA0-A757-0C924980D7A3',
'Pending',
1,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'DACE92B4-8FF1-40B9-AC32-4A1B98D9572D',
'923718EF-E932-4CA0-A757-0C924980D7A3',
'Sent',
2,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'1CF10CD2-878A-49A2-B12D-C899213B1E4F',
'923718EF-E932-4CA0-A757-0C924980D7A3',
'Delivered',
3,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'25840B41-336D-4E12-AE4D-6890A8A1CC56',
'923718EF-E932-4CA0-A757-0C924980D7A3',
'Read',
4,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'B12B3816-C63D-4956-B329-D9D996A32817',
'923718EF-E932-4CA0-A757-0C924980D7A3',
'Acknow ledged',
5,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'55EFD033-FD93-4068-A264-AE6124CB1C89',
'923718EF-E932-4CA0-A757-0C924980D7A3',
'Expired',
6,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'BD8B7667-E304-44FE-BCCD-A52462633CDE',
'923718EF-E932-4CA0-A757-0C924980D7A3',
'Archived',
7,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'0020A2C6-1818-4A8B-929F-20A22BE84400',
'923718EF-E932-4CA0-A757-0C924980D7A3',
'Deleted',
8,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'A82A2A37-FBC2-4438-97B6-723AC07670B2',
'CA40CE81-3D1C-4FD8-A2AC-0C867AEA94EB',
'Pending',
1,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'EC425AFC-BCC9-4755-9D38-1A052BE93AF8',
'CA40CE81-3D1C-4FD8-A2AC-0C867AEA94EB',
'Sent',
2,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'9D640A6A-B370-4E83-8A71-7D358010A91E',
'CA40CE81-3D1C-4FD8-A2AC-0C867AEA94EB',
'Failed',
3,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'EF4D9D31-F9B2-4246-8111-7A6C4D6B80BE',
'CA40CE81-3D1C-4FD8-A2AC-0C867AEA94EB',
'Archived',
4,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'7C414381-9CA6-4C54-83E7-4914DBB8BD6C',
'CA40CE81-3D1C-4FD8-A2AC-0C867AEA94EB',
'Deleted',
5,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'F61DB0B3-9D36-46B8-9B7E-76C4E3CD18DB',
'37E38302-24D4-42CA-8D6F-03E1A50563CE',
'Draft',
1,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'FF3D7010-06DF-4D0B-8236-AD8D34BFD3AF',
'37E38302-24D4-42CA-8D6F-03E1A50563CE',
'Pending Approval',
2,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'22A75A93-243D-471C-A1AD-D8032D1EB8A0',
'37E38302-24D4-42CA-8D6F-03E1A50563CE',
'Active',
3,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'2B43DB9A-DA31-4B8B-B9DC-94934B5355B9',
'37E38302-24D4-42CA-8D6F-03E1A50563CE',
'Completed',
4,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'F7842754-B02F-4BB6-9537-94E2785C6792',
'37E38302-24D4-42CA-8D6F-03E1A50563CE',
'Expired',
5,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'AA4034DB-6C73-4DE5-95CD-F0B438538565',
'37E38302-24D4-42CA-8D6F-03E1A50563CE',
'Archived',
6,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'0EE758B1-2D96-4BDB-A71E-F125D5F28AAA',
'37E38302-24D4-42CA-8D6F-03E1A50563CE',
'Deleted',
7,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'D32C03F3-C7C8-4E57-B002-349FC04189B4',
'E71C86FE-D75C-4B4E-89CF-854D3319DD8E',
'Pending',
1,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'245B47B6-95E8-427F-97E4-4E538CEB8D66',
'E71C86FE-D75C-4B4E-89CF-854D3319DD8E',
'Under Review',
2,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'A6C8D57C-E272-4D22-8FFC-1832228B9DD0',
'E71C86FE-D75C-4B4E-89CF-854D3319DD8E',
'Approved',
3,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'F1968A2C-6AF1-404B-8D9F-A8A91BD5A486',
'E71C86FE-D75C-4B4E-89CF-854D3319DD8E',
'Rejected',
4,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'F64AC5B6-2F37-40BD-B786-D4B5CE922484',
'E71C86FE-D75C-4B4E-89CF-854D3319DD8E',
'Escalated',
5,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'1CC635E8-C568-41FE-8F55-1EE86BE9F3C5',
'E71C86FE-D75C-4B4E-89CF-854D3319DD8E',
'Canceled',
6,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'EAF71BE3-B0BD-490E-A8DD-250E7C5F3F88',
'E71C86FE-D75C-4B4E-89CF-854D3319DD8E',
'Archived',
7,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'869CD6EA-3EC1-4A5F-A256-0C3D52FDEED2',
'E71C86FE-D75C-4B4E-89CF-854D3319DD8E',
'Deleted',
8,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'21459354-6467-473F-8887-061E9EEB3830',
'259260B1-AC2E-4528-947A-FCBEF129B49B',
'Draft',
1,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'E7CAE4E5-478C-4F4D-8218-9CF180369255',
'259260B1-AC2E-4528-947A-FCBEF129B49B',
'Pending Approval',
2,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'4F52AD7D-2966-48EA-AD37-A34C2B715106',
'259260B1-AC2E-4528-947A-FCBEF129B49B',
'Active',
3,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'F0F3CF53-2FED-433E-B1AE-F0643ED9FCBD',
'259260B1-AC2E-4528-947A-FCBEF129B49B',
'Inactive',
4,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'FFD59170-97CB-454E-8F8E-BEBC21A62683',
'259260B1-AC2E-4528-947A-FCBEF129B49B',
'Deprecated',
5,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'2421A759-78EC-4CD2-BA65-2579192FD2D0',
'259260B1-AC2E-4528-947A-FCBEF129B49B',
'Archived',
6,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'C88C3073-CF05-4F79-B0AD-60999DABF9DF',
'3CCE17BF-1E34-4E3A-BB6D-DFB8C9497938',
'Draft',
1,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'EA47B634-7A47-4AD8-8A9C-94B9B8AF450E',
'3CCE17BF-1E34-4E3A-BB6D-DFB8C9497938',
'PendingApproval',
2,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'672F51CB-0C2B-4FF1-9B36-46B5FAEA96CC',
'3CCE17BF-1E34-4E3A-BB6D-DFB8C9497938',
'Active',
3,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'5C2B809E-7F2A-4731-8B9D-A56E14ABCF86',
'3CCE17BF-1E34-4E3A-BB6D-DFB8C9497938',
'Suspended',
4,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'01F7B387-3428-4C9B-8F3A-610CA89BED1E',
'3CCE17BF-1E34-4E3A-BB6D-DFB8C9497938',
'Revoked',
5,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'81EAD57C-00FF-437A-A881-50364F1E1D7B',
'3CCE17BF-1E34-4E3A-BB6D-DFB8C9497938',
'Archived',
6,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'01971B8A-971C-40D4-B62D-A69CF54C9D87',
'3CCE17BF-1E34-4E3A-BB6D-DFB8C9497938',
'Deleted',
7,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'7F35E3F7-A72B-4642-AA20-A5487EC94269',
'791C1E48-11AD-49B1-8426-6C444A4ABBFF',
'Draft',
1,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'80FE0C57-5C5D-4B72-A816-C7D2FB67D34E',
'791C1E48-11AD-49B1-8426-6C444A4ABBFF',
'PendingApproval',
2,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'5637D612-0C8F-4E3C-9B2E-C0AD9889C02E',
'791C1E48-11AD-49B1-8426-6C444A4ABBFF',
'Active',
3,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'D7C68320-A00D-4F2C-A879-1569AA5ACF49',
'791C1E48-11AD-49B1-8426-6C444A4ABBFF',
'Suspended',
4,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'5566DB09-661E-4160-9F19-C95CDB3D40C4',
'791C1E48-11AD-49B1-8426-6C444A4ABBFF',
'Revoked',
5,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'6BBD0B1F-1663-4BC7-901F-7C53D10C67B2',
'791C1E48-11AD-49B1-8426-6C444A4ABBFF',
'Archived',
6,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'9A92BA9E-73F1-4BF6-AEF8-318294DEEB6D',
'791C1E48-11AD-49B1-8426-6C444A4ABBFF',
'Deleted',
7,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'8834AC87-209D-43DE-AED6-FC6D5AE1196D',
'78C0D76D-C025-4B63-B5D9-420675DC8BA9',
'Draft',
1,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'1817957C-9476-4794-96CC-242BAFCDE384',
'78C0D76D-C025-4B63-B5D9-420675DC8BA9',
'PendingApproval',
2,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'30E6022E-2263-4B1D-A145-4551A1BDD197',
'78C0D76D-C025-4B63-B5D9-420675DC8BA9',
'Active',
3,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'997CFA5A-673F-4015-9D9E-0668BF408F2D',
'78C0D76D-C025-4B63-B5D9-420675DC8BA9',
'Suspended',
4,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'E8BDF7E7-ABBE-44EF-92F9-D90AC0E1D267',
'78C0D76D-C025-4B63-B5D9-420675DC8BA9',
'Revoked',
5,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'B7747258-18FA-461C-93A7-E4BD4BF6089A',
'78C0D76D-C025-4B63-B5D9-420675DC8BA9',
'Archived',
6,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'3A3FFD5A-E6F4-4190-8653-6660054D251A',
'78C0D76D-C025-4B63-B5D9-420675DC8BA9',
'Deleted',
7,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'491A0DA4-B9DC-4157-9E98-C70AE85C457E',
'F4BCD6BB-D067-41E4-AF1E-F325FDA6A1BB',
'New',
1,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'802AA608-666A-4AA7-9C2F-E578A07711DF',
'F4BCD6BB-D067-41E4-AF1E-F325FDA6A1BB',
'InProcess',
2,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'103D2C07-A3A8-4B93-9813-EADD4CA4603B',
'F4BCD6BB-D067-41E4-AF1E-F325FDA6A1BB',
'Processed',
3,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'4DCA1690-BD97-47B5-BD23-11F6EDAA8AAF',
'F4BCD6BB-D067-41E4-AF1E-F325FDA6A1BB',
'Archived',
4,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

insert into [Sc_Setting].[Tb_Status]
(
[Status_Id],
[Status_Entity],
[Status_Value],
[Status_Order],
[Status_Application],
[Status_Status],
[Status_CreatedOn],
[Status_CreatedBy],
[Status_ModifiedOn],
[Status_ModifiedBy]
)
values
(
'64C0937F-F990-4634-B748-233B478A714C',
'F4BCD6BB-D067-41E4-AF1E-F325FDA6A1BB',
'Deleted',
5,
'28F9597B-9FB4-4397-962F-1BAB6332D697',
'282EAE03-EC9B-4666-BEBA-25A0FE0D7515',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B',
'2025-01-01',
'C9F732D6-2C1C-4F34-AB59-2DC220FF2F8B'
)

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     INSERT INICIAL DE LA TABLA TB_ACTION                          *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */	



/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CRERATE KEYS & CONSTRAINTS DE LA TABLA TB_APPLICATION         *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */	

if not exists(select [COLUMN_DEFAULT] from [INFORMATION_SCHEMA].[COLUMNS] where [TABLE_NAME] = 'Tb_Application' and [COLUMN_NAME] = 'Application_Id' and [COLUMN_DEFAULT] is not null)
exec ('alter table [Sc_Setting].[Tb_Application] add constraint [Df_Tb_Application_Application_Id] default newid() for [Application_Id]')
go

if not exists(select [COLUMN_DEFAULT] from [INFORMATION_SCHEMA].[COLUMNS] where [TABLE_NAME] = 'Tb_Application' and [COLUMN_NAME] = 'Application_CreatedOn' and [COLUMN_DEFAULT] is not null)
exec ('alter table [Sc_Setting].[Tb_Application] add constraint [Df_Tb_Application_Application_CreatedOn] default getdate() for [Application_CreatedOn]')
go

if not exists(select [COLUMN_DEFAULT] from [INFORMATION_SCHEMA].[COLUMNS] where [TABLE_NAME] = 'Tb_Application' and [COLUMN_NAME] = 'Application_ModifiedOn' and [COLUMN_DEFAULT] is not null)
exec ('alter table [Sc_Setting].[Tb_Application] add constraint [Df_Tb_Application_Application_ModifiedOn] default getdate() for [Application_ModifiedOn]')
go

if not exists(select [CONSTRAINT_NAME] from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Application' and [COLUMN_NAME] = 'Application_Id')
exec ('alter table [Sc_Setting].[Tb_Application] add constraint [Pk_Tb_Application_Application_Id] primary key clustered ([Application_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Application' and COLUMN_NAME = 'Application_Status')
exec ('alter table [Sc_Setting].[Tb_Application] add constraint [Fk_Tb_Application_Tb_Status_Application_Status] foreign key ([Application_Status]) references [Sc_Setting].[Tb_Status]([Status_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Application' and COLUMN_NAME = 'Application_CreatedBy')
exec ('alter table [Sc_Setting].[Tb_Application] add constraint [Fk_Tb_Application_Tb_User_Application_CreatedBy] foreign key ([Application_CreatedBy]) references [Sc_Security].[Tb_User]([User_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Application' and COLUMN_NAME = 'Application_ModifiedBy')
exec ('alter table [Sc_Setting].[Tb_Application] add constraint [Fk_Tb_Application_Tb_User_Application_ModifiedBy] foreign key ([Application_ModifiedBy]) references [Sc_Security].[Tb_User]([User_Id])')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CRERATE KEYS & CONSTRAINTS DE LA TABLA TB_ENTITY              *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */	

if not exists(select [COLUMN_DEFAULT] from [INFORMATION_SCHEMA].[COLUMNS] where [TABLE_NAME] = 'Tb_Entity' and [COLUMN_NAME] = 'Entity_Id' and [COLUMN_DEFAULT] is not null)
exec ('alter table [Sc_Setting].[Tb_Entity] add constraint [Df_Tb_Entity_Entity_Id] default newid() for [Entity_Id]')
go

if not exists(select [COLUMN_DEFAULT] from [INFORMATION_SCHEMA].[COLUMNS] where [TABLE_NAME] = 'Tb_Entity' and [COLUMN_NAME] = 'Entity_CreatedOn' and [COLUMN_DEFAULT] is not null)
exec ('alter table [Sc_Setting].[Tb_Entity] add constraint [Df_Tb_Entity_Entity_CreatedOn] default getdate() for [Entity_CreatedOn]')
go

if not exists(select [COLUMN_DEFAULT] from [INFORMATION_SCHEMA].[COLUMNS] where [TABLE_NAME] = 'Tb_Entity' and [COLUMN_NAME] = 'Entity_ModifiedOn' and [COLUMN_DEFAULT] is not null)
exec ('alter table [Sc_Setting].[Tb_Entity] add constraint [Df_Tb_Entity_Entity_ModifiedOn] default getdate() for [Entity_ModifiedOn]')
go

if not exists(select [CONSTRAINT_NAME] from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Entity' and [COLUMN_NAME] = 'Entity_Id')
exec ('alter table [Sc_Setting].[Tb_Entity] add constraint [Pk_Tb_Entity_Entity_Id] primary key clustered ([Entity_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Entity' and COLUMN_NAME = 'Entity_Application')
exec ('alter table [Sc_Setting].[Tb_Entity] add constraint [Fk_Tb_Entity_Tb_Application_Entity_Application] foreign key ([Entity_Application]) references [Sc_Setting].[Tb_Application]([Application_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Entity' and COLUMN_NAME = 'Entity_Status')
exec ('alter table [Sc_Setting].[Tb_Entity] add constraint [Fk_Tb_Entity_Tb_Status_Entity_Status] foreign key ([Entity_Status]) references [Sc_Setting].[Tb_Status]([Status_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Entity' and COLUMN_NAME = 'Entity_CreatedBy')
exec ('alter table [Sc_Setting].[Tb_Entity] add constraint [Fk_Tb_Entity_Tb_User_Entity_CreatedBy] foreign key ([Entity_CreatedBy]) references [Sc_Security].[Tb_User]([User_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Entity' and COLUMN_NAME = 'Entity_ModifiedBy')
exec ('alter table [Sc_Setting].[Tb_Entity] add constraint [Fk_Tb_Entity_Tb_User_Entity_ModifiedBy] foreign key ([Entity_ModifiedBy]) references [Sc_Security].[Tb_User]([User_Id])')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CRERATE KEYS & CONSTRAINTS DE LA TABLA TB_STATUS              *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */	

if not exists(select [COLUMN_DEFAULT] from [INFORMATION_SCHEMA].[COLUMNS] where [TABLE_NAME] = 'Tb_Status' and [COLUMN_NAME] = 'Status_Id' and [COLUMN_DEFAULT] is not null)
exec ('alter table [Sc_Setting].[Tb_Status] add constraint [Df_Tb_Status_Status_Id] default newid() for [Status_Id]')
go

if not exists(select [COLUMN_DEFAULT] from [INFORMATION_SCHEMA].[COLUMNS] where [TABLE_NAME] = 'Tb_Status' and [COLUMN_NAME] = 'Status_CreatedOn' and [COLUMN_DEFAULT] is not null)
exec ('alter table [Sc_Setting].[Tb_Status] add constraint [Df_Tb_Status_Status_CreatedOn] default getdate() for [Status_CreatedOn]')
go

if not exists(select [COLUMN_DEFAULT] from [INFORMATION_SCHEMA].[COLUMNS] where [TABLE_NAME] = 'Tb_Status' and [COLUMN_NAME] = 'Status_ModifiedOn' and [COLUMN_DEFAULT] is not null)
exec ('alter table [Sc_Setting].[Tb_Status] add constraint [Df_Tb_Status_Status_ModifiedOn] default getdate() for [Status_ModifiedOn]')
go

if not exists(select [CONSTRAINT_NAME] from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Status' and [COLUMN_NAME] = 'Status_Id')
exec ('alter table [Sc_Setting].[Tb_Status] add constraint [Pk_Tb_Status_Status_Id] primary key clustered ([Status_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Status' and COLUMN_NAME = 'Status_Entity')
exec ('alter table [Sc_Setting].[Tb_Status] add constraint [Fk_Tb_Status_Tb_Entity_Status_Entity] foreign key ([Status_Entity]) references [Sc_Setting].[Tb_Entity]([Entity_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Status' and COLUMN_NAME = 'Status_Application')
exec ('alter table [Sc_Setting].[Tb_Status] add constraint [Fk_Tb_Status_Tb_Application_Status_Application] foreign key ([Status_Application]) references [Sc_Setting].[Tb_Application]([Application_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Status' and COLUMN_NAME = 'Status_Status')
exec ('alter table [Sc_Setting].[Tb_Status] add constraint [Fk_Tb_Status_Tb_Status_Status_Status] foreign key ([Status_Status]) references [Sc_Setting].[Tb_Status]([Status_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Status' and COLUMN_NAME = 'Status_CreatedBy')
exec ('alter table [Sc_Setting].[Tb_Status] add constraint [Fk_Tb_Status_Tb_User_Status_CreatedBy] foreign key ([Status_CreatedBy]) references [Sc_Security].[Tb_User]([User_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Status' and COLUMN_NAME = 'Status_ModifiedBy')
exec ('alter table [Sc_Setting].[Tb_Status] add constraint [Fk_Tb_Status_Tb_User_Status_ModifiedBy] foreign key ([Status_ModifiedBy]) references [Sc_Security].[Tb_User]([User_Id])')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CRERATE KEYS & CONSTRAINTS DE LA TABLA TB_ACTION              *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */	
 
 AQUI!
 
 /* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CRERATE KEYS & CONSTRAINTS DE LA TABLA TB_CONCEPT              *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */	
 
if not exists(select [COLUMN_DEFAULT] from [INFORMATION_SCHEMA].[COLUMNS] where [TABLE_NAME] = 'Tb_Concept' and [COLUMN_NAME] = 'Concept_Id' and [COLUMN_DEFAULT] is not null)
exec ('alter table [Sc_Setting].[Tb_Concept] add constraint [Df_Tb_Concept_Concept_Id] default newid() for [Concept_Id]')
go

if not exists(select [COLUMN_DEFAULT] from [INFORMATION_SCHEMA].[COLUMNS] where [TABLE_NAME] = 'Tb_Concept' and [COLUMN_NAME] = 'Concept_CreatedOn' and [COLUMN_DEFAULT] is not null)
exec ('alter table [Sc_Setting].[Tb_Concept] add constraint [Df_Tb_Concept_Concept_CreatedOn] default getdate() for [Concept_CreatedOn]')
go

if not exists(select [COLUMN_DEFAULT] from [INFORMATION_SCHEMA].[COLUMNS] where [TABLE_NAME] = 'Tb_Concept' and [COLUMN_NAME] = 'Concept_ModifiedOn' and [COLUMN_DEFAULT] is not null)
exec ('alter table [Sc_Setting].[Tb_Concept] add constraint [Df_Tb_Concept_Concept_ModifiedOn] default getdate() for [Concept_ModifiedOn]')
go

if not exists(select [CONSTRAINT_NAME] from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Concept' and [COLUMN_NAME] = 'Concept_Id')
exec ('alter table [Sc_Setting].[Tb_Concept] add constraint [Pk_Tb_Concept_Concept_Id] primary key clustered ([Concept_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Concept' and COLUMN_NAME = 'Concept_Application')
exec ('alter table [Sc_Setting].[Tb_Concept] add constraint [Fk_Tb_Concept_Tb_Application_Concept_Application] foreign key ([Concept_Application]) references [Sc_Setting].[Tb_Application]([Application_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Concept' and COLUMN_NAME = 'Concept_Status')
exec ('alter table [Sc_Setting].[Tb_Concept] add constraint [Fk_Tb_Concept_Tb_Status_Concept_Status] foreign key ([Concept_Status]) references [Sc_Setting].[Tb_Status]([Status_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Concept' and COLUMN_NAME = 'Concept_CreatedBy')
exec ('alter table [Sc_Setting].[Tb_Concept] add constraint [Fk_Tb_Concept_Tb_User_Concept_CreatedBy] foreign key ([Concept_CreatedBy]) references [Sc_Security].[Tb_User]([User_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Concept' and COLUMN_NAME = 'Concept_ModifiedBy')
exec ('alter table [Sc_Setting].[Tb_Concept] add constraint [Fk_Tb_Concept_Tb_User_Concept_ModifiedBy] foreign key ([Concept_ModifiedBy]) references [Sc_Security].[Tb_User]([User_Id])')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CRERATE KEYS & CONSTRAINTS DE LA TABLA TB_CATALOG             *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */	

if not exists(select [COLUMN_DEFAULT] from [INFORMATION_SCHEMA].[COLUMNS] where [TABLE_NAME] = 'Tb_Catalog' and [COLUMN_NAME] = 'Catalog_Id' and [COLUMN_DEFAULT] is not null)
exec ('alter table [Sc_Setting].[Tb_Catalog] add constraint [Df_Tb_Catalog_Catalog_Id] default newid() for [Catalog_Id]')
go

if not exists(select [COLUMN_DEFAULT] from [INFORMATION_SCHEMA].[COLUMNS] where [TABLE_NAME] = 'Tb_Catalog' and [COLUMN_NAME] = 'Catalog_CreatedOn' and [COLUMN_DEFAULT] is not null)
exec ('alter table [Sc_Setting].[Tb_Catalog] add constraint [Df_Tb_Catalog_Catalog_CreatedOn] default getdate() for [Catalog_CreatedOn]')
go

if not exists(select [COLUMN_DEFAULT] from [INFORMATION_SCHEMA].[COLUMNS] where [TABLE_NAME] = 'Tb_Catalog' and [COLUMN_NAME] = 'Catalog_ModifiedOn' and [COLUMN_DEFAULT] is not null)
exec ('alter table [Sc_Setting].[Tb_Catalog] add constraint [Df_Tb_Catalog_Catalog_ModifiedOn] default getdate() for [Catalog_ModifiedOn]')
go

if not exists(select [CONSTRAINT_NAME] from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Catalog' and [COLUMN_NAME] = 'Catalog_Id')
exec ('alter table [Sc_Setting].[Tb_Catalog] add constraint [Pk_Tb_Catalog_Catalog_Id] primary key clustered ([Catalog_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Catalog' and COLUMN_NAME = 'Catalog_Parent')
exec ('alter table [Sc_Setting].[Tb_Catalog] add constraint [Fk_Tb_Catalog_Tb_Catalog_Catalog_Parent] foreign key ([Catalog_Parent]) references [Sc_Setting].[Tb_Catalog]([Catalog_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Catalog' and COLUMN_NAME = 'Catalog_Application')
exec ('alter table [Sc_Setting].[Tb_Catalog] add constraint [Fk_Tb_Catalog_Tb_Application_Catalog_Application] foreign key ([Catalog_Application]) references [Sc_Setting].[Tb_Application]([Application_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Catalog' and COLUMN_NAME = 'Catalog_Status')
exec ('alter table [Sc_Setting].[Tb_Catalog] add constraint [Fk_Tb_Catalog_Tb_Status_Catalog_Status] foreign key ([Catalog_Status]) references [Sc_Setting].[Tb_Status]([Status_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Catalog' and COLUMN_NAME = 'Catalog_CreatedBy')
exec ('alter table [Sc_Setting].[Tb_Catalog] add constraint [Fk_Tb_Catalog_Tb_User_Catalog_CreatedBy] foreign key ([Catalog_CreatedBy]) references [Sc_Security].[Tb_User]([User_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Catalog' and COLUMN_NAME = 'Catalog_ModifiedBy')
exec ('alter table [Sc_Setting].[Tb_Catalog] add constraint [Fk_Tb_Catalog_Tb_User_Catalog_ModifiedBy] foreign key ([Catalog_ModifiedBy]) references [Sc_Security].[Tb_User]([User_Id])')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CRERATE KEYS & CONSTRAINTS DE LA TABLA TB_PARAMETER           *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists(select [COLUMN_DEFAULT] from [INFORMATION_SCHEMA].[COLUMNS] where [TABLE_NAME] = 'Tb_Parameter' and [COLUMN_NAME] = 'Parameter_Id' and [COLUMN_DEFAULT] is not null)
exec ('alter table [Sc_Setting].[Tb_Parameter] add constraint [Df_Tb_Parameter_Parameter_Id] default newid() for [Parameter_Id]')
go

if not exists(select [COLUMN_DEFAULT] from [INFORMATION_SCHEMA].[COLUMNS] where [TABLE_NAME] = 'Tb_Parameter' and [COLUMN_NAME] = 'Parameter_CreatedOn' and [COLUMN_DEFAULT] is not null)
exec ('alter table [Sc_Setting].[Tb_Parameter] add constraint [Df_Tb_Parameter_Parameter_CreatedOn] default getdate() for [Parameter_CreatedOn]')
go

if not exists(select [COLUMN_DEFAULT] from [INFORMATION_SCHEMA].[COLUMNS] where [TABLE_NAME] = 'Tb_Parameter' and [COLUMN_NAME] = 'Parameter_ModifiedOn' and [COLUMN_DEFAULT] is not null)
exec ('alter table [Sc_Setting].[Tb_Parameter] add constraint [Df_Tb_Parameter_Parameter_ModifiedOn] default getdate() for [Parameter_ModifiedOn]')
go

if not exists(select [CONSTRAINT_NAME] from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Parameter' and [COLUMN_NAME] = 'Parameter_Id')
exec ('alter table [Sc_Setting].[Tb_Parameter] add constraint [Pk_Tb_Parameter_Parameter_Id] primary key clustered ([Parameter_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Parameter' and COLUMN_NAME = 'Parameter_Type')
exec ('alter table [Sc_Setting].[Tb_Parameter] add constraint [Fk_Tb_Parameter_Tb_Concept_Parameter_Type] foreign key ([Parameter_Type]) references [Sc_Setting].[Tb_Concept]([Concept_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Parameter' and COLUMN_NAME = 'Parameter_Application')
exec ('alter table [Sc_Setting].[Tb_Parameter] add constraint [Fk_Tb_Parameter_Tb_Application_Parameter_Application] foreign key ([Parameter_Application]) references [Sc_Setting].[Tb_Application]([Application_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Parameter' and COLUMN_NAME = 'Parameter_Status')
exec ('alter table [Sc_Setting].[Tb_Parameter] add constraint [Fk_Tb_Parameter_Tb_Status_Parameter_Status] foreign key ([Parameter_Status]) references [Sc_Setting].[Tb_Status]([Status_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Parameter' and COLUMN_NAME = 'Parameter_CreatedBy')
exec ('alter table [Sc_Setting].[Tb_Parameter] add constraint [Fk_Tb_Parameter_Tb_User_Parameter_CreatedBy] foreign key ([Parameter_CreatedBy]) references [Sc_Security].[Tb_User]([User_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Parameter' and COLUMN_NAME = 'Parameter_ModifiedBy')
exec ('alter table [Sc_Setting].[Tb_Parameter] add constraint [Fk_Tb_Parameter_Tb_User_Parameter_ModifiedBy] foreign key ([Parameter_ModifiedBy]) references [Sc_Security].[Tb_User]([User_Id])')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CRERATE KEYS & CONSTRAINTS DE LA TABLA TB_FILE                *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists(select [COLUMN_DEFAULT] from [INFORMATION_SCHEMA].[COLUMNS] where [TABLE_NAME] = 'Tb_File' and [COLUMN_NAME] = 'File_Id' and [COLUMN_DEFAULT] is not null)
exec ('alter table [Sc_Setting].[Tb_File] add constraint [Df_Tb_File_File_Id] default newid() for [File_Id]')
go

if not exists(select [COLUMN_DEFAULT] from [INFORMATION_SCHEMA].[COLUMNS] where [TABLE_NAME] = 'Tb_File' and [COLUMN_NAME] = 'File_CreatedOn' and [COLUMN_DEFAULT] is not null)
exec ('alter table [Sc_Setting].[Tb_File] add constraint [Df_Tb_File_File_CreatedOn] default getdate() for [File_CreatedOn]')
go

if not exists(select [COLUMN_DEFAULT] from [INFORMATION_SCHEMA].[COLUMNS] where [TABLE_NAME] = 'Tb_File' and [COLUMN_NAME] = 'File_ModifiedOn' and [COLUMN_DEFAULT] is not null)
exec ('alter table [Sc_Setting].[Tb_File] add constraint [Df_Tb_File_File_ModifiedOn] default getdate() for [File_ModifiedOn]')
go

if not exists(select [CONSTRAINT_NAME] from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_File' and [COLUMN_NAME] = 'File_Id')
exec ('alter table [Sc_Setting].[Tb_File] add constraint [Pk_Tb_File_File_Id] primary key clustered ([File_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_File' and COLUMN_NAME = 'File_Extension')
exec ('alter table [Sc_Setting].[Tb_File] add constraint [Fk_Tb_File_Tb_Catalog_File_Extension] foreign key ([File_Extension]) references [Sc_Setting].[Tb_Catalog]([Catalog_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_File' and COLUMN_NAME = 'File_Previous')
exec ('alter table [Sc_Setting].[Tb_File] add constraint [Fk_Tb_File_Tb_File_File_Previous] foreign key ([File_Previous]) references [Sc_Setting].[Tb_File]([File_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_File' and COLUMN_NAME = 'File_ReferenceType')
exec ('alter table [Sc_Setting].[Tb_File] add constraint [Fk_Tb_File_Tb_Entity_File_ReferenceType] foreign key ([File_ReferenceType]) references [Sc_Setting].[Tb_Entity]([Entity_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_File' and COLUMN_NAME = 'File_Application')
exec ('alter table [Sc_Setting].[Tb_File] add constraint [Fk_Tb_File_Tb_Application_File_Application] foreign key ([File_Application]) references [Sc_Setting].[Tb_Application]([Application_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_File' and COLUMN_NAME = 'File_Status')
exec ('alter table [Sc_Setting].[Tb_File] add constraint [Fk_Tb_File_Tb_Status_File_Status] foreign key ([File_Status]) references [Sc_Setting].[Tb_Status]([Status_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_File' and COLUMN_NAME = 'File_CreatedBy')
exec ('alter table [Sc_Setting].[Tb_File] add constraint [Fk_Tb_File_Tb_User_File_CreatedBy] foreign key ([File_CreatedBy]) references [Sc_Security].[Tb_User]([User_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_File' and COLUMN_NAME = 'File_ModifiedBy')
exec ('alter table [Sc_Setting].[Tb_File] add constraint [Fk_Tb_File_Tb_User_File_ModifiedBy] foreign key ([File_ModifiedBy]) references [Sc_Security].[Tb_User]([User_Id])')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CRERATE KEYS & CONSTRAINTS DE LA TABLA TB_CONTACT             *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists(select [COLUMN_DEFAULT] from [INFORMATION_SCHEMA].[COLUMNS] where [TABLE_NAME] = 'Tb_Contact' and [COLUMN_NAME] = 'Contact_Id' and [COLUMN_DEFAULT] is not null)
exec ('alter table [Sc_Setting].[Tb_Contact] add constraint [Df_Tb_Contact_Contact_Id] default newid() for [Contact_Id]')
go

if not exists(select [COLUMN_DEFAULT] from [INFORMATION_SCHEMA].[COLUMNS] where [TABLE_NAME] = 'Tb_Contact' and [COLUMN_NAME] = 'Contact_IsPrimary' and [COLUMN_DEFAULT] is not null)
exec ('alter table [Sc_Setting].[Tb_Contact] add constraint [Df_Tb_Contact_Contact_IsPrimary] default 0 for [Contact_IsPrimary]')
go

if not exists(select [COLUMN_DEFAULT] from [INFORMATION_SCHEMA].[COLUMNS] where [TABLE_NAME] = 'Tb_Contact' and [COLUMN_NAME] = 'Contact_CreatedOn' and [COLUMN_DEFAULT] is not null)
exec ('alter table [Sc_Setting].[Tb_Contact] add constraint [Df_Tb_Contact_Contact_CreatedOn] default getdate() for [Contact_CreatedOn]')
go

if not exists(select [COLUMN_DEFAULT] from [INFORMATION_SCHEMA].[COLUMNS] where [TABLE_NAME] = 'Tb_Contact' and [COLUMN_NAME] = 'Contact_ModifiedOn' and [COLUMN_DEFAULT] is not null)
exec ('alter table [Sc_Setting].[Tb_Contact] add constraint [Df_Tb_Contact_Contact_ModifiedOn] default getdate() for [Contact_ModifiedOn]')
go

if not exists(select [CONSTRAINT_NAME] from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Contact' and [COLUMN_NAME] = 'Contact_Id')
exec ('alter table [Sc_Setting].[Tb_Contact] add constraint [Pk_Tb_Contact_Contact_Id] primary key clustered ([Contact_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Contact' and COLUMN_NAME = 'Contact_Type')
exec ('alter table [Sc_Setting].[Tb_Contact] add constraint [Fk_Tb_Contact_Tb_Catalog_Contact_Type] foreign key ([Contact_Type]) references [Sc_Setting].[Tb_Catalog]([Catalog_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Contact' and COLUMN_NAME = 'Contact_ReferenceType')
exec ('alter table [Sc_Setting].[Tb_Contact] add constraint [Fk_Tb_Contact_Tb_Entity_Contact_ReferenceType] foreign key ([Contact_ReferenceType]) references [Sc_Setting].[Tb_Entity]([Entity_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Contact' and COLUMN_NAME = 'Contact_Application')
exec ('alter table [Sc_Setting].[Tb_Contact] add constraint [Fk_Tb_Contact_Tb_Application_Contact_Application] foreign key ([Contact_Application]) references [Sc_Setting].[Tb_Application]([Application_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Contact' and COLUMN_NAME = 'Contact_Status')
exec ('alter table [Sc_Setting].[Tb_Contact] add constraint [Fk_Tb_Contact_Tb_Status_Contact_Status] foreign key ([Contact_Status]) references [Sc_Setting].[Tb_Status]([Status_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Contact' and COLUMN_NAME = 'Contact_CreatedBy')
exec ('alter table [Sc_Setting].[Tb_Contact] add constraint [Fk_Tb_Contact_Tb_User_Contact_CreatedBy] foreign key ([Contact_CreatedBy]) references [Sc_Security].[Tb_User]([User_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Contact' and COLUMN_NAME = 'Contact_ModifiedBy')
exec ('alter table [Sc_Setting].[Tb_Contact] add constraint [Fk_Tb_Contact_Tb_User_Contact_ModifiedBy] foreign key ([Contact_ModifiedBy]) references [Sc_Security].[Tb_User]([User_Id])')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CRERATE KEYS & CONSTRAINTS DE LA TABLA TB_COMMENT             *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists(select [COLUMN_DEFAULT] from [INFORMATION_SCHEMA].[COLUMNS] where [TABLE_NAME] = 'Tb_Comment' and [COLUMN_NAME] = 'Comment_Id' and [COLUMN_DEFAULT] is not null)
exec ('alter table [Sc_Setting].[Tb_Comment] add constraint [Df_Tb_Comment_Comment_Id] default newid() for [Comment_Id]')
go

if not exists(select [COLUMN_DEFAULT] from [INFORMATION_SCHEMA].[COLUMNS] where [TABLE_NAME] = 'Tb_Comment' and [COLUMN_NAME] = 'Comment_CreatedOn' and [COLUMN_DEFAULT] is not null)
exec ('alter table [Sc_Setting].[Tb_Comment] add constraint [Df_Tb_Comment_Comment_CreatedOn] default getdate() for [Comment_CreatedOn]')
go

if not exists(select [COLUMN_DEFAULT] from [INFORMATION_SCHEMA].[COLUMNS] where [TABLE_NAME] = 'Tb_Comment' and [COLUMN_NAME] = 'Comment_ModifiedOn' and [COLUMN_DEFAULT] is not null)
exec ('alter table [Sc_Setting].[Tb_Comment] add constraint [Df_Tb_Comment_Comment_ModifiedOn] default getdate() for [Comment_ModifiedOn]')
go

if not exists(select [CONSTRAINT_NAME] from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Comment' and [COLUMN_NAME] = 'Comment_Id')
exec ('alter table [Sc_Setting].[Tb_Comment] add constraint [Pk_Tb_Comment_Comment_Id] primary key clustered ([Comment_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Comment' and COLUMN_NAME = 'Comment_RespondingTo')
exec ('alter table [Sc_Setting].[Tb_Comment] add constraint [Fk_Tb_Comment_Tb_Comment_Comment_RespondingTo] foreign key ([Comment_RespondingTo]) references [Sc_Setting].[Tb_Comment]([Comment_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Comment' and COLUMN_NAME = 'Comment_ReferenceType')
exec ('alter table [Sc_Setting].[Tb_Comment] add constraint [Fk_Tb_Comment_Tb_Entity_Comment_ReferenceType] foreign key ([Comment_ReferenceType]) references [Sc_Setting].[Tb_Entity]([Entity_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Comment' and COLUMN_NAME = 'Comment_Application')
exec ('alter table [Sc_Setting].[Tb_Comment] add constraint [Fk_Tb_Comment_Tb_Application_Comment_Application] foreign key ([Comment_Application]) references [Sc_Setting].[Tb_Application]([Application_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Comment' and COLUMN_NAME = 'Comment_Status')
exec ('alter table [Sc_Setting].[Tb_Comment] add constraint [Fk_Tb_Comment_Tb_Status_Comment_Status] foreign key ([Comment_Status]) references [Sc_Setting].[Tb_Status]([Status_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Comment' and COLUMN_NAME = 'Comment_CreatedBy')
exec ('alter table [Sc_Setting].[Tb_Comment] add constraint [Fk_Tb_Comment_Tb_User_Comment_CreatedBy] foreign key ([Comment_CreatedBy]) references [Sc_Security].[Tb_User]([User_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Comment' and COLUMN_NAME = 'Comment_ModifiedBy')
exec ('alter table [Sc_Setting].[Tb_Comment] add constraint [Fk_Tb_Comment_Tb_User_Comment_ModifiedBy] foreign key ([Comment_ModifiedBy]) references [Sc_Security].[Tb_User]([User_Id])')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CRERATE KEYS & CONSTRAINTS DE LA TABLA TB_ADDRESS             *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists(select [COLUMN_DEFAULT] from [INFORMATION_SCHEMA].[COLUMNS] where [TABLE_NAME] = 'Tb_Address' and [COLUMN_NAME] = 'Address_Id' and [COLUMN_DEFAULT] is not null)
exec ('alter table [Sc_Setting].[Tb_Address] add constraint [Df_Tb_Address_Address_Id] default newid() for [Address_Id]')
go

if not exists(select [COLUMN_DEFAULT] from [INFORMATION_SCHEMA].[COLUMNS] where [TABLE_NAME] = 'Tb_Address' and [COLUMN_NAME] = 'Address_IsCurrent' and [COLUMN_DEFAULT] is not null)
exec ('alter table [Sc_Setting].[Tb_Address] add constraint [Df_Tb_Address_Address_IsCurrent] default 0 for [Address_IsCurrent]')
go

if not exists(select [COLUMN_DEFAULT] from [INFORMATION_SCHEMA].[COLUMNS] where [TABLE_NAME] = 'Tb_Address' and [COLUMN_NAME] = 'Address_CreatedOn' and [COLUMN_DEFAULT] is not null)
exec ('alter table [Sc_Setting].[Tb_Address] add constraint [Df_Tb_Address_Address_CreatedOn] default getdate() for [Address_CreatedOn]')
go

if not exists(select [COLUMN_DEFAULT] from [INFORMATION_SCHEMA].[COLUMNS] where [TABLE_NAME] = 'Tb_Address' and [COLUMN_NAME] = 'Address_ModifiedOn' and [COLUMN_DEFAULT] is not null)
exec ('alter table [Sc_Setting].[Tb_Address] add constraint [Df_Tb_Address_Address_ModifiedOn] default getdate() for [Address_ModifiedOn]')
go

if not exists(select [CONSTRAINT_NAME] from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Address' and [COLUMN_NAME] = 'Address_Id')
exec ('alter table [Sc_Setting].[Tb_Address] add constraint [Pk_Tb_Address_Address_Id] primary key clustered ([Address_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Address' and COLUMN_NAME = 'Address_City')
exec ('alter table [Sc_Setting].[Tb_Address] add constraint [Fk_Tb_Address_Tb_Catalog_Address_City] foreign key ([Address_City]) references [Sc_Setting].[Tb_Catalog]([Catalog_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Address' and COLUMN_NAME = 'Address_State')
exec ('alter table [Sc_Setting].[Tb_Address] add constraint [Fk_Tb_Address_Tb_Catalog_Address_State] foreign key ([Address_State]) references [Sc_Setting].[Tb_Catalog]([Catalog_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Address' and COLUMN_NAME = 'Address_Country')
exec ('alter table [Sc_Setting].[Tb_Address] add constraint [Fk_Tb_Address_Tb_Catalog_Address_Country] foreign key ([Address_Country]) references [Sc_Setting].[Tb_Catalog]([Catalog_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Address' and COLUMN_NAME = 'Address_ReferenceType')
exec ('alter table [Sc_Setting].[Tb_Address] add constraint [Fk_Tb_Address_Tb_Entity_Address_ReferenceType] foreign key ([Address_ReferenceType]) references [Sc_Setting].[Tb_Entity]([Entity_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Address' and COLUMN_NAME = 'Address_Application')
exec ('alter table [Sc_Setting].[Tb_Address] add constraint [Fk_Tb_Address_Tb_Application_Address_Application] foreign key ([Address_Application]) references [Sc_Setting].[Tb_Application]([Application_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Address' and COLUMN_NAME = 'Address_Status')
exec ('alter table [Sc_Setting].[Tb_Address] add constraint [Fk_Tb_Address_Tb_Status_Address_Status] foreign key ([Address_Status]) references [Sc_Setting].[Tb_Status]([Status_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Address' and COLUMN_NAME = 'Address_CreatedBy')
exec ('alter table [Sc_Setting].[Tb_Address] add constraint [Fk_Tb_Address_Tb_User_Address_CreatedBy] foreign key ([Address_CreatedBy]) references [Sc_Security].[Tb_User]([User_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Address' and COLUMN_NAME = 'Address_ModifiedBy')
exec ('alter table [Sc_Setting].[Tb_Address] add constraint [Fk_Tb_Address_Tb_User_Address_ModifiedBy] foreign key ([Address_ModifiedBy]) references [Sc_Security].[Tb_User]([User_Id])')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CRERATE KEYS & CONSTRAINTS DE LA TABLA TB_MODULE              *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists(select [COLUMN_DEFAULT] from [INFORMATION_SCHEMA].[COLUMNS] where [TABLE_NAME] = 'Tb_Module' and [COLUMN_NAME] = 'Module_Id' and [COLUMN_DEFAULT] is not null)
exec ('alter table [Sc_Setting].[Tb_Module] add constraint [Df_Tb_Module_Module_Id] default newid() for [Module_Id]')
go

if not exists(select [COLUMN_DEFAULT] from [INFORMATION_SCHEMA].[COLUMNS] where [TABLE_NAME] = 'Tb_Module' and [COLUMN_NAME] = 'Module_CreatedOn' and [COLUMN_DEFAULT] is not null)
exec ('alter table [Sc_Setting].[Tb_Module] add constraint [Df_Tb_Module_Module_CreatedOn] default getdate() for [Module_CreatedOn]')
go

if not exists(select [COLUMN_DEFAULT] from [INFORMATION_SCHEMA].[COLUMNS] where [TABLE_NAME] = 'Tb_Module' and [COLUMN_NAME] = 'Module_ModifiedOn' and [COLUMN_DEFAULT] is not null)
exec ('alter table [Sc_Setting].[Tb_Module] add constraint [Df_Tb_Module_Module_ModifiedOn] default getdate() for [Module_ModifiedOn]')
go

if not exists(select [CONSTRAINT_NAME] from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Module' and [COLUMN_NAME] = 'Module_Id')
exec ('alter table [Sc_Setting].[Tb_Module] add constraint [Pk_Tb_Module_Module_Id] primary key clustered ([Module_Id])')

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Module' and COLUMN_NAME = 'Module_Application')
exec ('alter table [Sc_Setting].[Tb_Module] add constraint [Fk_Tb_Module_Tb_Application_Module_Application] foreign key ([Module_Application]) references [Sc_Setting].[Tb_Application]([Application_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Module' and COLUMN_NAME = 'Module_Status')
exec ('alter table [Sc_Setting].[Tb_Module] add constraint [Fk_Tb_Module_Tb_Status_Module_Status] foreign key ([Module_Status]) references [Sc_Setting].[Tb_Status]([Status_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Module' and COLUMN_NAME = 'Module_CreatedBy')
exec ('alter table [Sc_Setting].[Tb_Module] add constraint [Fk_Tb_Module_Tb_User_Module_CreatedBy] foreign key ([Module_CreatedBy]) references [Sc_Security].[Tb_User]([User_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Module' and COLUMN_NAME = 'Module_ModifiedBy')
exec ('alter table [Sc_Setting].[Tb_Module] add constraint [Fk_Tb_Module_Tb_User_Module_ModifiedBy] foreign key ([Module_ModifiedBy]) references [Sc_Security].[Tb_User]([User_Id])')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CRERATE KEYS & CONSTRAINTS DE LA TABLA TB_MENU                *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists(select [COLUMN_DEFAULT] from [INFORMATION_SCHEMA].[COLUMNS] where [TABLE_NAME] = 'Tb_Menu' and [COLUMN_NAME] = 'Menu_Id' and [COLUMN_DEFAULT] is not null)
exec ('alter table [Sc_Setting].[Tb_Menu] add constraint [Df_Tb_Menu_Menu_Id] default newid() for [Menu_Id]')
go

if not exists(select [COLUMN_DEFAULT] from [INFORMATION_SCHEMA].[COLUMNS] where [TABLE_NAME] = 'Tb_Menu' and [COLUMN_NAME] = 'Menu_CreatedOn' and [COLUMN_DEFAULT] is not null)
exec ('alter table [Sc_Setting].[Tb_Menu] add constraint [Df_Tb_Menu_Menu_CreatedOn] default getdate() for [Menu_CreatedOn]')
go

if not exists(select [COLUMN_DEFAULT] from [INFORMATION_SCHEMA].[COLUMNS] where [TABLE_NAME] = 'Tb_Menu' and [COLUMN_NAME] = 'Menu_ModifiedOn' and [COLUMN_DEFAULT] is not null)
exec ('alter table [Sc_Setting].[Tb_Menu] add constraint [Df_Tb_Menu_Menu_ModifiedOn] default getdate() for [Menu_ModifiedOn]')
go

if not exists(select [CONSTRAINT_NAME] from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Menu' and [COLUMN_NAME] = 'Menu_Id')
exec ('alter table [Sc_Setting].[Tb_Menu] add constraint [Pk_Tb_Menu_Menu_Id] primary key clustered ([Menu_Id])')

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Menu' and COLUMN_NAME = 'Menu_Icon')
exec ('alter table [Sc_Setting].[Tb_Menu] add constraint [Fk_Tb_Menu_Tb_File_Menu_Icon] foreign key ([Menu_Icon]) references [Sc_Setting].[Tb_File]([File_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Menu' and COLUMN_NAME = 'Menu_Parent')
exec ('alter table [Sc_Setting].[Tb_Menu] add constraint [Fk_Tb_Menu_Tb_Menu_Menu_Parent] foreign key ([Menu_Parent]) references [Sc_Setting].[Tb_Menu]([Menu_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Menu' and COLUMN_NAME = 'Menu_Module')
exec ('alter table [Sc_Setting].[Tb_Menu] add constraint [Fk_Tb_Menu_Tb_Module_Menu_Module] foreign key ([Menu_Module]) references [Sc_Setting].[Tb_Module]([Module_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Menu' and COLUMN_NAME = 'Menu_Application')
exec ('alter table [Sc_Setting].[Tb_Menu] add constraint [Fk_Tb_Menu_Tb_Application_Menu_Application] foreign key ([Menu_Application]) references [Sc_Setting].[Tb_Application]([Application_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Menu' and COLUMN_NAME = 'Menu_Status')
exec ('alter table [Sc_Setting].[Tb_Menu] add constraint [Fk_Tb_Menu_Tb_Status_Menu_Status] foreign key ([Menu_Status]) references [Sc_Setting].[Tb_Status]([Status_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Menu' and COLUMN_NAME = 'Menu_CreatedBy')
exec ('alter table [Sc_Setting].[Tb_Menu] add constraint [Fk_Tb_Menu_Tb_User_Menu_CreatedBy] foreign key ([Menu_CreatedBy]) references [Sc_Security].[Tb_User]([User_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Menu' and COLUMN_NAME = 'Menu_ModifiedBy')
exec ('alter table [Sc_Setting].[Tb_Menu] add constraint [Fk_Tb_Menu_Tb_User_Menu_ModifiedBy] foreign key ([Menu_ModifiedBy]) references [Sc_Security].[Tb_User]([User_Id])')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CRERATE KEYS & CONSTRAINTS DE LA TABLA TB_CONVERSATION        *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */
 
if not exists(select [COLUMN_DEFAULT] from [INFORMATION_SCHEMA].[COLUMNS] where [TABLE_NAME] = 'Tb_Conversation' and [COLUMN_NAME] = 'Conversation_Id' and [COLUMN_DEFAULT] is not null)
exec ('alter table [Sc_Setting].[Tb_Conversation] add constraint [Df_Tb_Conversation_Conversation_Id] default newid() for [Conversation_Id]')
go

if not exists(select [COLUMN_DEFAULT] from [INFORMATION_SCHEMA].[COLUMNS] where [TABLE_NAME] = 'Tb_Conversation' and [COLUMN_NAME] = 'Conversation_CreatedOn' and [COLUMN_DEFAULT] is not null)
exec ('alter table [Sc_Setting].[Tb_Conversation] add constraint [Df_Tb_Conversation_Conversation_CreatedOn] default getdate() for [Conversation_CreatedOn]')
go

if not exists(select [COLUMN_DEFAULT] from [INFORMATION_SCHEMA].[COLUMNS] where [TABLE_NAME] = 'Tb_Conversation' and [COLUMN_NAME] = 'Conversation_ModifiedOn' and [COLUMN_DEFAULT] is not null)
exec ('alter table [Sc_Setting].[Tb_Conversation] add constraint [Df_Tb_Conversation_Conversation_ModifiedOn] default getdate() for [Conversation_ModifiedOn]')
go

if not exists(select [CONSTRAINT_NAME] from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Conversation' and [COLUMN_NAME] = 'Conversation_Id')
exec ('alter table [Sc_Setting].[Tb_Conversation] add constraint [Pk_Tb_Conversation_Conversation_Id] primary key clustered ([Conversation_Id])')

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Conversation' and COLUMN_NAME = 'Conversation_Type')
exec ('alter table [Sc_Setting].[Tb_Conversation] add constraint [Fk_Tb_Conversation_Tb_Catalog_Conversation_Type] foreign key ([Conversation_Type]) references [Sc_Setting].[Tb_Catalog]([Catalog_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Conversation' and COLUMN_NAME = 'Conversation_Image')
exec ('alter table [Sc_Setting].[Tb_Conversation] add constraint [Fk_Tb_Conversation_Tb_File_Conversation_Image] foreign key ([Conversation_Image]) references [Sc_Setting].[Tb_File]([File_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Conversation' and COLUMN_NAME = 'Conversation_Admin')
exec ('alter table [Sc_Setting].[Tb_Conversation] add constraint [Fk_Tb_Conversation_Tb_User_Conversation_Admin] foreign key ([Conversation_Admin]) references [Sc_Security].[Tb_User]([User_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Conversation' and COLUMN_NAME = 'Conversation_Application')
exec ('alter table [Sc_Setting].[Tb_Conversation] add constraint [Fk_Tb_Conversation_Tb_Application_Conversation_Application] foreign key ([Conversation_Application]) references [Sc_Setting].[Tb_Application]([Application_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Conversation' and COLUMN_NAME = 'Conversation_Status')
exec ('alter table [Sc_Setting].[Tb_Conversation] add constraint [Fk_Tb_Conversation_Tb_Status_Conversation_Status] foreign key ([Conversation_Status]) references [Sc_Setting].[Tb_Status]([Status_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Conversation' and COLUMN_NAME = 'Conversation_CreatedBy')
exec ('alter table [Sc_Setting].[Tb_Conversation] add constraint [Fk_Tb_Conversation_Tb_User_Conversation_CreatedBy] foreign key ([Conversation_CreatedBy]) references [Sc_Security].[Tb_User]([User_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Conversation' and COLUMN_NAME = 'Conversation_ModifiedBy')
exec ('alter table [Sc_Setting].[Tb_Conversation] add constraint [Fk_Tb_Conversation_Tb_User_Conversation_ModifiedBy] foreign key ([Conversation_ModifiedBy]) references [Sc_Security].[Tb_User]([User_Id])')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CRERATE KEYS & CONSTRAINTS DE LA TABLA TB_PARTICIPANT         *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists(select [COLUMN_DEFAULT] from [INFORMATION_SCHEMA].[COLUMNS] where [TABLE_NAME] = 'Tb_Participant' and [COLUMN_NAME] = 'Participant_Id' and [COLUMN_DEFAULT] is not null)
exec ('alter table [Sc_Setting].[Tb_Participant] add constraint [Df_Tb_Participant_Participant_Id] default newid() for [Participant_Id]')
go

if not exists(select [COLUMN_DEFAULT] from [INFORMATION_SCHEMA].[COLUMNS] where [TABLE_NAME] = 'Tb_Participant' and [COLUMN_NAME] = 'Participant_CreatedOn' and [COLUMN_DEFAULT] is not null)
exec ('alter table [Sc_Setting].[Tb_Participant] add constraint [Df_Tb_Participant_Participant_CreatedOn] default getdate() for [Participant_CreatedOn]')
go

if not exists(select [COLUMN_DEFAULT] from [INFORMATION_SCHEMA].[COLUMNS] where [TABLE_NAME] = 'Tb_Participant' and [COLUMN_NAME] = 'Participant_ModifiedOn' and [COLUMN_DEFAULT] is not null)
exec ('alter table [Sc_Setting].[Tb_Participant] add constraint [Df_Tb_Participant_Participant_ModifiedOn] default getdate() for [Participant_ModifiedOn]')
go

if not exists(select [CONSTRAINT_NAME] from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Participant' and [COLUMN_NAME] = 'Participant_Id')
exec ('alter table [Sc_Setting].[Tb_Participant] add constraint [Pk_Tb_Participant_Participant_Id] primary key clustered ([Participant_Id])')

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Participant' and COLUMN_NAME = 'Participant_Conversation')
exec ('alter table [Sc_Setting].[Tb_Participant] add constraint [Fk_Tb_Participant_Tb_Conversation_Participant_Conversation] foreign key ([Participant_Conversation]) references [Sc_Setting].[Tb_Conversation]([Conversation_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Participant' and COLUMN_NAME = 'Participant_User')
exec ('alter table [Sc_Setting].[Tb_Participant] add constraint [Fk_Tb_Participant_Tb_User_Participant_User] foreign key ([Participant_User]) references [Sc_Security].[Tb_User]([User_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Participant' and COLUMN_NAME = 'Participant_Application')
exec ('alter table [Sc_Setting].[Tb_Participant] add constraint [Fk_Tb_Participant_Tb_Application_Participant_Application] foreign key ([Participant_Application]) references [Sc_Setting].[Tb_Application]([Application_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Participant' and COLUMN_NAME = 'Participant_Status')
exec ('alter table [Sc_Setting].[Tb_Participant] add constraint [Fk_Tb_Participant_Tb_Status_Participant_Status] foreign key ([Participant_Status]) references [Sc_Setting].[Tb_Status]([Status_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Participant' and COLUMN_NAME = 'Participant_CreatedBy')
exec ('alter table [Sc_Setting].[Tb_Participant] add constraint [Fk_Tb_Participant_Tb_User_Participant_CreatedBy] foreign key ([Participant_CreatedBy]) references [Sc_Security].[Tb_User]([User_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Participant' and COLUMN_NAME = 'Participant_ModifiedBy')
exec ('alter table [Sc_Setting].[Tb_Participant] add constraint [Fk_Tb_Participant_Tb_User_Participant_ModifiedBy] foreign key ([Participant_ModifiedBy]) references [Sc_Security].[Tb_User]([User_Id])')
go

/* * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 *     CRERATE KEYS & CONSTRAINTS DE LA TABLA TB_MESSAGE             *
 * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * */

if not exists(select [COLUMN_DEFAULT] from [INFORMATION_SCHEMA].[COLUMNS] where [TABLE_NAME] = 'Tb_Message' and [COLUMN_NAME] = 'Message_Id' and [COLUMN_DEFAULT] is not null)
exec ('alter table [Sc_Setting].[Tb_Message] add constraint [Df_Tb_Message_Message_Id] default newid() for [Message_Id]')
go

if not exists(select [COLUMN_DEFAULT] from [INFORMATION_SCHEMA].[COLUMNS] where [TABLE_NAME] = 'Tb_Message' and [COLUMN_NAME] = 'Message_CreatedOn' and [COLUMN_DEFAULT] is not null)
exec ('alter table [Sc_Setting].[Tb_Message] add constraint [Df_Tb_Message_Message_CreatedOn] default getdate() for [Message_CreatedOn]')
go

if not exists(select [COLUMN_DEFAULT] from [INFORMATION_SCHEMA].[COLUMNS] where [TABLE_NAME] = 'Tb_Message' and [COLUMN_NAME] = 'Message_ModifiedOn' and [COLUMN_DEFAULT] is not null)
exec ('alter table [Sc_Setting].[Tb_Message] add constraint [Df_Tb_Message_Message_ModifiedOn] default getdate() for [Message_ModifiedOn]')
go

if not exists(select [CONSTRAINT_NAME] from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Message' and [COLUMN_NAME] = 'Message_Id')
exec ('alter table [Sc_Setting].[Tb_Message] add constraint [Pk_Tb_Message_Message_Id] primary key clustered ([Message_Id])')

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Message' and COLUMN_NAME = 'Message_Sender')
exec ('alter table [Sc_Setting].[Tb_Message] add constraint [Fk_Tb_Message_Tb_User_Message_Sender] foreign key ([Message_Sender]) references [Sc_Security].[Tb_User]([User_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Message' and COLUMN_NAME = 'Message_Conversation')
exec ('alter table [Sc_Setting].[Tb_Message] add constraint [Fk_Tb_Message_Tb_Conversation_Message_Conversation] foreign key ([Message_Conversation]) references [Sc_Setting].[Tb_Conversation]([Conversation_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Message' and COLUMN_NAME = 'Message_Application')
exec ('alter table [Sc_Setting].[Tb_Message] add constraint [Fk_Tb_Message_Tb_Application_Message_Application] foreign key ([Message_Application]) references [Sc_Setting].[Tb_Application]([Application_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Message' and COLUMN_NAME = 'Message_Status')
exec ('alter table [Sc_Setting].[Tb_Message] add constraint [Fk_Tb_Message_Tb_Status_Message_Status] foreign key ([Message_Status]) references [Sc_Setting].[Tb_Status]([Status_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Message' and COLUMN_NAME = 'Message_CreatedBy')
exec ('alter table [Sc_Setting].[Tb_Message] add constraint [Fk_Tb_Message_Tb_User_Message_CreatedBy] foreign key ([Message_CreatedBy]) references [Sc_Security].[Tb_User]([User_Id])')
go

if not exists(select * from [INFORMATION_SCHEMA].[KEY_COLUMN_USAGE] where [TABLE_NAME] = 'Tb_Message' and COLUMN_NAME = 'Message_ModifiedBy')
exec ('alter table [Sc_Setting].[Tb_Message] add constraint [Fk_Tb_Message_Tb_User_Message_ModifiedBy] foreign key ([Message_ModifiedBy]) references [Sc_Security].[Tb_User]([User_Id])')
go