using { USERS } from '../db/Schema';

service skyTalentService{
 entity users as projection on USERS;
}