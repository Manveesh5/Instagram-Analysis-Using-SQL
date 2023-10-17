/*Identify the five oldest users on Instagram from the Database.*/

select * from users order by created_at asc limit 5; 

/*Inactive User Engagement:Identify users who have never posted a single photo on Instagram.*/

select users.id,username from users
	 left join photos
	 on users.id = photos.user_id where photos.id is NULL 
	 order by username asc; 



