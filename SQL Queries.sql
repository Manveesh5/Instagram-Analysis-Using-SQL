/*Identify the five oldest users on Instagram from the Database.*/

select * from users order by created_at asc limit 5; 

/*Inactive User Engagement:Identify users who have never posted a single photo on Instagram.*/

select users.id,username from users
	 left join photos
	 on users.id = photos.user_id where photos.id is NULL 
	 order by username asc; 

/*Contest Winner Declaration: The team has organized a contest where the user with the most likes on a single photo wins.*/

select users.id ,users.username ,photos.image_url,count(*) as `Total Likes` from likes
 inner join photos on photos.id = likes.photo_id
 inner join users on users.id = likes.photo_id
 group by photos.id
 order by `Total Likes` desc limit 1; 

