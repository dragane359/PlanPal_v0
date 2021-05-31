# PlanPal - Meetings Made Easy! 

![Techtopia-2](https://user-images.githubusercontent.com/84222148/120170351-73643600-c233-11eb-9a02-6739cec98614.png)

PlanPal

The one-stop application to ease your scheduling worries!

Motivation

Amidst the hustle and bustle of your busy schedule, you thought about meeting your old friends after a while. Thinking that your friends will be busy, you decided to delay a meetup with them to a later date. You finally decided to contact them, but to your dismay, another year has passed, you find out that your friends are even busier with their schedules. A reunion seems to be impossible to organise. 

Adulting is no easy task. Oftentimes, meeting up with friends and loved ones is delayed not because everyone is busy, but instead due to the fact that coordinating schedules manually is not a small feat, with work and study schedules subject to change. Hence, a single place where groups can come together and organise their group actviities is a neccesity. Two key features that people need have been identified, the generation of common time slots and the tracking of payments.

Personally, having tried to organise group sessions with friends, I find to be extremely cumbersome and often impossible to keep track of everyone's schedules and come up with slots that people are free at. Messaging multiple people individually and keeping track of their free slots on telegram becomes rather annoying to all parties involved. Additionally, it is easy to forget what payments I need to make and who I'm yet to receive from. This problem served as motivation for me to work on this project. 

Aim

We hope to be able to provide users with a platform for them to identify common timings to make events happen. Here, they will be able to join different groups to schedule and plan meetups. Additional features are tailor-made to ensure that the entirety of the meeting up is hassle-free. Examples include payment trackers and notifation senders when requesting payment.  

User Stories
<table>
<tbody>
<tr>
<td>
<p><span style="font-weight: 400;">As a...</span></p>
</td>
<td>
<p><span style="font-weight: 400;">I&nbsp; want to...</span></p>
</td>
<td>
<p><span style="font-weight: 400;">So that I can...</span></p>
</td>
</tr>
<tr>
<td>
<p><span style="font-weight: 400;">User</span></p>
</td>
<td>
<p><span style="font-weight: 400;">Be able to have a quick glance at the calendar to know my schedule</span></p>
</td>
<td>
<p><span style="font-weight: 400;">Make suitable arrangement to plans appointments and meetups</span></p>
</td>
</tr>
<tr>
<td>
<p><span style="font-weight: 400;">User</span></p>
</td>
<td>
<p><span style="font-weight: 400;">Be able to add friends and sort them into groups&nbsp;</span></p>
</td>
<td>
<p><span style="font-weight: 400;">Identify different group of friends schedule easily</span></p>
</td>
</tr>
<tr>
<td>
<p><span style="font-weight: 400;">User</span></p>
</td>
<td>
<p><span style="font-weight: 400;">Be able to add my schedule and view my group&rsquo;s schedule</span></p>
</td>
<td>
<p><span style="font-weight: 400;">Identify the appropriate timing for a meetup. (The app suggests this automatically)</span></p>
</td>
</tr>
<tr>
<td>
<p><span style="font-weight: 400;">User</span></p>
</td>
<td>
<p><span style="font-weight: 400;">Be able to track payments and request bills from friends easily</span></p>
</td>
<td>
<p><span style="font-weight: 400;">Saves time and provides a hassle-free appointment</span></p>
</td>
</tr>
<tr>
<td>
<p><span style="font-weight: 400;">Admin</span></p>
</td>
<td>
<p><span style="font-weight: 400;">Be able to moderate user accounts on my site.</span></p>
</td>
<td>
<p><span style="font-weight: 400;">Identify and flag out users who violate code of conduct, and remove them</span></p>
</td>
</tr>
</tbody>
</table>

Technologies Used

Flutter

Firebase

Our Features

<table>
<tbody>
<tr>
<td>
<p><span style="font-weight: 400;">Feature</span></p>
</td>
<td>
<p><span style="font-weight: 400;">Functionality</span></p>
</td>
</tr>
<tr>
<td colspan="2">
<p><strong>PlanPal Account Management</strong></p>
</td>
</tr>
<tr>
<td>
<p><span style="font-weight: 400;">Log-in</span></p>
</td>
<td>
<p><span style="font-weight: 400;">Allows users to enter their credentials and sign-in to their account of the app if they had already created one.</span></p>
</td>
</tr>
<tr>
<td>
<p><span style="font-weight: 400;">Log-in (With Google)</span></p>
</td>
<td>
<p><span style="font-weight: 400;">Allows users to sign-in to the app using their Google account.&nbsp;</span></p>
</td>
</tr>
<tr>
<td>
<p><span style="font-weight: 400;">Log-out</span></p>
</td>
<td>
<p><span style="font-weight: 400;">Allows the users to sign out of their app and brings them back to the log-in page.</span></p>
</td>
</tr>
<tr>
<td>
<p><span style="font-weight: 400;">Sign-up&nbsp;</span></p>
</td>
<td>
<p><span style="font-weight: 400;">Allows users to create a new account with their email-address.&nbsp;</span></p>
</td>
</tr>
<tr>
<td>
<p><span style="font-weight: 400;">Forgot Password</span></p>
</td>
<td>
<p><span style="font-weight: 400;">Allows users the option to change their password by sending an email to the email account that they used to register their PlanPal account.</span></p>
</td>
</tr>
<tr>
<td colspan="2">
<p><strong>My Profile</strong></p>
</td>
</tr>
<tr>
<td>
<p><span style="font-weight: 400;">My Profile Page</span></p>
</td>
<td>
<p><span style="font-weight: 400;">After logging in, the user can click on the My Profile button to view their personal info (username and Password).&nbsp;</span></p>
</td>
</tr>
<tr>
<td>
<p><span style="font-weight: 400;">Change Password</span></p>
</td>
<td>
<p><span style="font-weight: 400;">Users will be able click on this button to change their password if they want to. They can change it on the app itself, no emails required.&nbsp;</span></p>
</td>
</tr>
<tr>
<td colspan="2">
<p><strong>Common Slot Generation and Group Management</strong></p>
</td>
</tr>
<tr>
<td>
<p><span style="font-weight: 400;">My Groups Page</span></p>
</td>
<td>
<p><span style="font-weight: 400;">Users can click on this button after logging in to view the groups that they are in. Under the My Groups Page, they will see a list of their existing groups and will see options to create new groups or join new groups with &ldquo;Invite&rdquo; codes they have received.</span></p>
</td>
</tr>
<tr>
<td>
<p><span style="font-weight: 400;">Create New Group (On the My Groups page)</span></p>
</td>
<td>
<p><span style="font-weight: 400;">Users can click on this button to create a new group. A random group invite code will be generated and users can send these codes to their friends for them to join the group.</span></p>
</td>
</tr>
<tr>
<td>
<p><span style="font-weight: 400;">Join New Group (On the My Groups page)</span></p>
</td>
<td>
<p><span style="font-weight: 400;">Users can join a group by entering the code they received from the person who made that group.&nbsp;</span></p>
</td>
</tr>
<tr>
<td>
<p><span style="font-weight: 400;">Delete Group (On the My Groups page)</span></p>
</td>
<td>
<p><span style="font-weight: 400;">Users can choose to delete a group should they want to.</span></p>
</td>
</tr>
<tr>
<td>
<p><span style="font-weight: 400;">Create New Event (After clicking on a group in the My Groups page)</span></p>
</td>
<td>
<p><span style="font-weight: 400;">Users can create an event and set a fixed time period where they want this event to happen (for example, 21 May 21 - 24 May 21). Other users in the same group will be able to view this event.&nbsp;</span></p>
</td>
</tr>
<tr>
<td>
<p><span style="font-weight: 400;">Delete Event (After clicking on a group in the My Groups page)</span></p>
</td>
<td>
<p><span style="font-weight: 400;">Users can delete events if they want to.</span></p>
</td>
</tr>
<tr>
<td>
<p><span style="font-weight: 400;">Members in this Group (After clicking on a group in the My Groups page)</span></p>
</td>
<td>
<p><span style="font-weight: 400;">Users can view the people in the group.</span></p>
</td>
</tr>
<tr>
<td>
<p><span style="font-weight: 400;">Leave Group (After clicking on a group in the My Groups page)</span></p>
</td>
<td>
<p><span style="font-weight: 400;">Users can click on this button to leave a group if they want to.</span></p>
</td>
</tr>
<tr>
<td>
<p><span style="font-weight: 400;">Choose Your time slots where you are free (After clicking on an event in a group)</span></p>
</td>
<td>
<p><span style="font-weight: 400;">Users will be able to look at a calendar (based on the chosen timeframe) and select the time slots where they are free by touching the time slot boxes on their screen. They would also be able to view their group mates' free time slots on this screen as well. </span><strong>Common time slots will be calculated on a continual basis (i.e even if not everyone in the group has entered their time slots) and displayed on this screen</strong></p>
</td>
</tr>
<tr>
<td colspan="2">
<p><strong>My Schedule</strong></p>
</td>
</tr>
<tr>
<td>
<p><span style="font-weight: 400;">My Schedule</span></p>
</td>
<td>
<p><span style="font-weight: 400;">After logging in, users can click on this button to view the events they have in a calendar view.&nbsp;</span></p>
</td>
</tr>
<tr>
<td colspan="2">
<p><strong>Contact List</strong></p>
</td>
</tr>
<tr>
<td>
<p><span style="font-weight: 400;">My contacts</span></p>
</td>
<td>
<p><span style="font-weight: 400;">After logging in, users can click on this button to view the full list of people from all their groups.</span></p>
</td>
</tr>
<tr>
<td>
<p><span style="font-weight: 400;">Contact Info (After clicking on a person in My contacts)</span></p>
</td>
<td>
<p><span style="font-weight: 400;">Users will be able to view the contact info of that person (email address) and what groups they share.</span></p>
</td>
</tr>
<tr>
<td colspan="2">
<p><strong>Payment Tracker</strong></p>
</td>
</tr>
<tr>
<td>
<p><span style="font-weight: 400;">My Payments&nbsp;</span></p>
</td>
<td>
<p><span style="font-weight: 400;">After logging in, users can click on this button to view their payment info at a glance. </span><strong>A list of the people who you owe/are owed from will be displayed, each person in a box with one of 2 statements &ldquo;You owe {Person} $x&rdquo; or&nbsp; &ldquo;{Person} owes you $x&rdquo;. </strong><span style="font-weight: 400;">Users can also see a button to log transactions.</span></p>
</td>
</tr>
<tr>
<td>
<p><span style="font-weight: 400;">Log transaction (After clicking on the My Payments page)</span></p>
</td>
<td>
<p><span style="font-weight: 400;">Users can click on this button and will see options to either say they have paid $x or received $x from someone. They can choose from dropdown menus to select:</span></p>
<ol>
<li style="font-weight: 400;"><span style="font-weight: 400;">Whether they are the sender or receiver</span></li>
<li style="font-weight: 400;"><span style="font-weight: 400;">Name of Friend</span></li>
<li style="font-weight: 400;"><span style="font-weight: 400;">Float Input to input the actual amount involved.</span></li>
</ol>
<p><span style="font-weight: 400;">The database will log and update with these transactions.&nbsp;</span></p>
</td>
</tr>
<tr>
<td>
<p><span style="font-weight: 400;">Send Reminder (After clicking on the My Payments page)</span></p>
</td>
<td>
<p><span style="font-weight: 400;">Users can click on this button and will be able to send an email reminder to people who owe them money. They can do this by clicking on a person who owes them money and clicking &lsquo;send&rsquo;</span></p>
</td>
</tr>
</tbody>
</table>
<p>&nbsp;</p>

Timeline and Schedule

<table>
<tbody>
<tr>
<td>
<p><span style="font-weight: 400;">Milestone I</span></p>
</td>
<td>
<p><span style="font-weight: 400;">Milestone II</span></p>
</td>
<td>
<p><span style="font-weight: 400;">Milestone III</span></p>
</td>
</tr>
<tr>
<td>
<ol>
<li style="font-weight: 400;"><span style="font-weight: 400;">Create the log-in and sign up features using Firebase as our back-end database.</span></li>
</ol>
</td>
<td>
<ol>
<li style="font-weight: 400;"><span style="font-weight: 400;">Finalise log-in and sign-up features, with added support for &ldquo;Forgot Password&rdquo;</span></li>
<li style="font-weight: 400;"><span style="font-weight: 400;">Complete the implementation of groups and event creation.</span></li>
</ol>
<ol>
<li style="font-weight: 400;"><span style="font-weight: 400;">Complete the common slot feature.</span></li>
</ol>
</td>
<td>
<ul>
<li style="font-weight: 400;"><span style="font-weight: 400;">Complete the implementation of the payment tracker.</span></li>
<li style="font-weight: 400;"><span style="font-weight: 400;">Testing and Bug fixes</span></li>
</ul>
</td>
</tr>
</tbody>
</table>
Project Log
<p><br /></p>
<table>
<tbody>
<tr>
<td>
<p><span style="font-weight: 400;">Total hours</span></p>
</td>
<td>
<p><span style="font-weight: 400;">Jing Cheng</span></p>
</td>
<td>
<p><span style="font-weight: 400;">Ganesh</span></p>
</td>
</tr>
<tr>
<td>
<p><span style="font-weight: 400;">74</span></p>
</td>
<td>
<p><span style="font-weight: 400;">37</span></p>
</td>
<td>
<p><span style="font-weight: 400;">37</span></p>
</td>
</tr>
</tbody>
</table>
<p><br /></p>
<table>
<tbody>
<tr>
<td>
<p><span style="font-weight: 400;">S/N</span></p>
</td>
<td>
<p><span style="font-weight: 400;">Task</span></p>
</td>
<td>
<p><span style="font-weight: 400;">Date</span></p>
</td>
<td>
<p><span style="font-weight: 400;">Jing Cheng(hours)</span></p>
</td>
<td>
<p><span style="font-weight: 400;">Ganesh (hours)</span></p>
</td>
<td>
<p><span style="font-weight: 400;">Remarks</span></p>
</td>
</tr>
<tr>
<td>
<p><span style="font-weight: 400;">1</span></p>
</td>
<td>
<p><span style="font-weight: 400;">Meeting with Adviser</span></p>
</td>
<td>
<p><span style="font-weight: 400;">12/05/21</span></p>
</td>
<td>
<p><span style="font-weight: 400;">1</span></p>
</td>
<td>
<p><span style="font-weight: 400;">1</span></p>
</td>
<td>
<p><span style="font-weight: 400;">Briefing on Project Milestones &amp; Principles of Software Engineering + Q&amp;A</span></p>
</td>
</tr>
<tr>
<td>
<p><span style="font-weight: 400;">2</span></p>
</td>
<td>
<p><span style="font-weight: 400;">Team meeting and initial planning</span></p>
</td>
<td>
<p><span style="font-weight: 400;">13/05/21</span></p>
</td>
<td>
<p><span style="font-weight: 400;">2</span></p>
</td>
<td>
<p><span style="font-weight: 400;">2</span></p>
</td>
<td>
<p><span style="font-weight: 400;">Poster and video</span></p>
</td>
</tr>
<tr>
<td>
<p><span style="font-weight: 400;">3</span></p>
</td>
<td>
<p><span style="font-weight: 400;">ReactNative workshop</span></p>
</td>
<td>
<p><span style="font-weight: 400;">15/05/21</span></p>
</td>
<td>
<p><span style="font-weight: 400;">4</span></p>
</td>
<td>
<p><span style="font-weight: 400;">4</span></p>
</td>
<td>
<p><span style="font-weight: 400;">Workshop Preparation (2 hour)</span></p>
<p><span style="font-weight: 400;">Mission Control #1 (10-12pm)</span></p>
</td>
</tr>
<tr>
<td>
<p><span style="font-weight: 400;">4</span></p>
</td>
<td>
<p><span style="font-weight: 400;">Git workshop</span></p>
</td>
<td>
<p><span style="font-weight: 400;">15/05/21</span></p>
</td>
<td>
<p><span style="font-weight: 400;">2</span></p>
</td>
<td>
<p><span style="font-weight: 400;">2</span></p>
</td>
<td>
<p><span style="font-weight: 400;">Mission Control #1 (1-3pm)</span></p>
</td>
</tr>
<tr>
<td>
<p><span style="font-weight: 400;">5</span></p>
</td>
<td>
<p><span style="font-weight: 400;">Team meeting</span></p>
</td>
<td>
<p><span style="font-weight: 400;">21/05/21</span></p>
</td>
<td>
<p><span style="font-weight: 400;">2</span></p>
</td>
<td>
<p><span style="font-weight: 400;">2</span></p>
</td>
<td>
<p><span style="font-weight: 400;">Working of milestone 1</span></p>
<ul>
<li style="font-weight: 400;"><span style="font-weight: 400;">Researching of technologies</span></li>
</ul>
</td>
</tr>
<tr>
<td>
<p><span style="font-weight: 400;">6</span></p>
</td>
<td>
<p><span style="font-weight: 400;">ReactNative workshop #2</span></p>
</td>
<td>
<p><span style="font-weight: 400;">22/05/21</span></p>
</td>
<td>
<p><span style="font-weight: 400;">3</span></p>
</td>
<td>
<p><span style="font-weight: 400;">3</span></p>
</td>
<td>
<p><span style="font-weight: 400;">Workshop Preparation (1 hour)</span></p>
<p><span style="font-weight: 400;">Mission Control #2 (10-12pm)</span></p>
</td>
</tr>
<tr>
<td>
<p><span style="font-weight: 400;">7</span></p>
</td>
<td>
<p><span style="font-weight: 400;">Individual tasks</span></p>
</td>
<td>
<p><span style="font-weight: 400;">25/05/21</span></p>
</td>
<td>
<p><span style="font-weight: 400;">6</span></p>
</td>
<td>
<p><span style="font-weight: 400;">6</span></p>
</td>
<td>
<p><span style="font-weight: 400;">Learning the technologies required&nbsp;</span></p>
<ul>
<li style="font-weight: 400;"><span style="font-weight: 400;">Reactnative</span></li>
<li style="font-weight: 400;"><span style="font-weight: 400;">Javascript</span></li>
<li style="font-weight: 400;"><span style="font-weight: 400;">Firebase</span></li>
<li style="font-weight: 400;"><span style="font-weight: 400;">Flutter</span></li>
</ul>
</td>
</tr>
<tr>
<td>
<p><span style="font-weight: 400;">8</span></p>
</td>
<td>
<p><span style="font-weight: 400;">Individual tasks</span></p>
</td>
<td>
<p><span style="font-weight: 400;">26/05/21</span></p>
</td>
<td>
<p><span style="font-weight: 400;">3</span></p>
</td>
<td>
<p><span style="font-weight: 400;">3</span></p>
</td>
<td>
<p><span style="font-weight: 400;">Wireframes&nbsp;</span></p>
</td>
</tr>
<tr>
<td>
<p><span style="font-weight: 400;">9</span></p>
</td>
<td>
<p><span style="font-weight: 400;">Individual tasks</span></p>
</td>
<td>
<p><span style="font-weight: 400;">28/05/21</span></p>
</td>
<td>
<p><span style="font-weight: 400;">10</span></p>
</td>
<td>
<p><span style="font-weight: 400;">10</span></p>
</td>
<td>
<p><span style="font-weight: 400;">Coding and Debugging Log-in and register function of the application (Authentication and database using Flutter)</span></p>
</td>
</tr>
<tr>
<td>
<p><span style="font-weight: 400;">10</span></p>
</td>
<td>
<p><span style="font-weight: 400;">Team meeting</span></p>
</td>
<td>
<p><span style="font-weight: 400;">30/05/21</span></p>
</td>
<td>
<p><span style="font-weight: 400;">4</span></p>
</td>
<td>
<p><span style="font-weight: 400;">4</span></p>
</td>
<td>
<p><span style="font-weight: 400;">Finishing up Milestone 1</span></p>
</td>
</tr>
</tbody>
</table>
<p>&nbsp;</p>
Resources Used
https://blog.codemagic.io/flutter-web-firebase-authentication-and-google-sign-in/
https://github.com/kevinjnguyen/flutter-firebase-registration-ui 
https://medium.com/swlh/flutter-login-registration-using-firebase-1bef34007b91
https://www.bacancytechnology.com/blog/email-authentication-using-firebase-auth-and-flutter
https://github.com/lohanidamodar/flutter_ui_challenges
https://blog.codemagic.io/firebase-authentication-google-sign-in-using-flutter/
https://pusher.com/tutorials/login-ui-flutter
