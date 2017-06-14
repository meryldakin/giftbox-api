#Gift App

##User stories:
1. I can import my friends' birthdays from Facebook
2. I can add friends' birthdays who aren't on FB
3. I have a list of general gift-giving holidays that populates my calendar
4. I can add custom holidays to my calendar
5. I can associate people in my friends list with the holidays I want to get them gifts for
6. My calendar is synced so it will remind me when I need to start shopping for presents (it has an automatic 2 week reminder, but you can customize it to your needs)
7. I can add gift ideas for my friends and associate those gift ideas with a particular event (bday or holiday)
8. I can indicate which gift(s) I ended up buying for those friends
9. App will search for gift ideas on google shopping amazon/other sites and offer links to purchase items if you want

*Views:*
 - All upcoming events in calendar format
 - All upcoming events in list format
 - Friend page that shows upcoming holidays I need to get them gifts for with the gift ideas or purchased gifts for each
 - Friend-gift page: page for friend where you can add gift ideas
 - General gift page: page where you just add good gift ideas and can associate them with friends/events

###Associations:

**Account**: has_one user

**User**: has_many gifts, has_many events, has_many friendships, belongs_to account

**Gift**: has_many friends, has_many events, has_many stores

**Store**: has_many gifts

**EventList**: has_many friends, has_many gifts


###Major Tables:

**Account**
username | pw

**User**
firstName* | lastName* | birthday* | account

**Gifts**
item* | price | category |link

**Stores**
name* | website

**Events**
name* | type* | date*

###Join Tables:

**Friend-Gifts**
**Friend-Events**

**Gift-Stores**
**Gift-Events**

**Friendship**

API Keys:

Amazon Product Ad: AKIAJ4C52PX4IOEHJ54A
AWS Account ID: 2082-4402-9857
Canonical User ID: 9e0f448fb61640998c6605616cb19aa039d3a7569de0898da9b3cc63619bbb5a
