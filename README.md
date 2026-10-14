# Krishna Bhojnalay - Pure Vegetarian Food Ordering & Management System

> A full-stack web-based online food ordering and restaurant management platform dedicated to pure vegetarian and Sattvic dining in Shirpur, Maharashtra.

---

## 📌 Project Overview

**Krishna Bhojnalay** is an end-to-end food ordering and restaurant management platform developed as a Software Engineering project at **Mukesh Patel Technology Park, NMIMS Shirpur**, by **Soham, Preet, and Uditya**. 

Addressing the demand for authentic, verified vegetarian and dietary-compliant dining, the platform unifies popular local pure vegetarian eateries under a single digital hub. Beyond standard dining options, the system features dedicated categories for **Sattvic** and **No-Onion/No-Garlic** cuisine, making healthy and spiritually mindful meals accessible to students, faculty, and local residents.

---

## ✨ Key Features

### 👤 Customer Portal
- **User Authentication**: Secure user registration, login, and session persistence.
- **Restaurant Discovery**: Browse curated local pure veg eateries with contact details and operating hours.
- **Categorized Menu & Filtering**: Explore dishes filtered by culinary style (*North Indian, South Indian, Fast Food, Snacks, and Sattvic Cuisine*).
- **Sattvic & Healthy Diet Special**: Dedicated menu featuring *Lauki ki Sabji, Sattvic Moong Dal Soup, Samak Rice Pulao, Steamed Vegetable Bowls, Dal Palak*, and *Dal Khichdi*.
- **Interactive Cart & Checkout**: Real-time quantity adjustments, price calculations, and seamless checkout.
- **Payment Flexibility**: Supports both **Cash on Delivery (COD)** and digital online payments via **Razorpay**.
- **Order Tracking & History**: Track order lifecycle states (*Dispatching, Delivered, Rejected*) with administrative remarks.

### 🛠️ Administrative Management Suite
- **Interactive Admin Dashboard**: Overview of system statistics (total restaurants, active dishes, registered users, and orders).
- **Restaurant Onboarding & Editing**: Add, update, or remove restaurants with custom imagery, addresses, and timings.
- **Menu Engineering**: Complete CRUD operations for dishes, including high-resolution image uploads, price adjustments, and descriptions.
- **Category Management**: Define custom culinary categories and dietary tags.
- **Order Dispatch Pipeline**: Review incoming orders, update processing status, and attach status remarks for customer tracking.
- **User Account Oversight**: View registered customer profiles and activity logs.

---

## 🏪 Featured Restaurants & Menu Highlights

| Restaurant | Location | Cuisine Highlights |
| :--- | :--- | :--- |
| **Hotel Palavi Family Restaurant** | Mumbai - Agra National Highway 3, Near Tapi Bridge | Paneer Butter Masala, Veg Kolhapuri, Sattvic Bowls, Dal Palak |
| **Sai Swad Pure Veg Restaurant** | Karvand Naka, Main Road, Shirpur | Masala Dosa, Paneer Tikka Masala, Hyderabadi Dum Biryani |
| **Utsav Pure Veg Restaurant** | Near New Bus Stand, Main Road, Shirpur | Shahi Paneer, Kashmiri Veg Pulao, Malai Kofta, Dal Makhani |
| **Patil's Pizza & Fast Food** | Karvand Naka Road, Opp. Market Yard, Shirpur | Margherita Pizza, Veggie Farmhouse Pizza, Garlic Breadsticks |

---

## 💻 Tech Stack

- **Frontend**: HTML5, CSS3, JavaScript (ES6), jQuery, Bootstrap 4, CSS Flexbox (equal-height responsive cards)
- **Backend**: PHP (Object-oriented & procedural scripts, session management, secure routing)
- **Database**: MySQL (Relational schema with normalized tables, foreign keys, and cascading constraints)
- **Payment Gateway**: Razorpay PHP SDK integration
- **Development Server**: Apache (XAMPP Environment)

---

## 🚀 Local Installation & Setup

Follow these steps to run the application on your local machine using **XAMPP**:

### Prerequisites
- [XAMPP](https://www.apachefriends.org/) (Apache + MySQL + PHP 7.4 or PHP 8.x)
- Any modern web browser (Chrome, Edge, Firefox)
- Code Editor (VS Code recommended)

### Step-by-Step Instructions

1. **Clone or Download the Repository**:
   ```bash
   git clone https://github.com/<your-username>/<repo-name>.git
   ```

2. **Move to XAMPP Webroot**:
   Move the project folder into your XAMPP `htdocs` directory:
   ```text
   C:\xampp\htdocs\Food_Ordering_System
   ```

3. **Start Apache & MySQL**:
   Open **XAMPP Control Panel** and click **Start** for both **Apache** and **MySQL**.

4. **Import the Database**:
   - Open your browser and navigate to `http://localhost/phpmyadmin/`.
   - Click **New** in the left sidebar and create a database named:
     ```text
     onlinefoodphp
     ```
   - Select the newly created `onlinefoodphp` database, go to the **Import** tab.
   - Click **Choose File**, select `DATABASE FILE/onlinefoodphp.sql` from the project folder, and click **Import**.

5. **Launch the Application**:
   - Customer Portal: `http://localhost/Food_Ordering_System/`
   - Admin Panel: `http://localhost/Food_Ordering_System/admin/`

---

## 🔑 Default Credentials

### Administrator Login
- **URL**: `http://localhost/Food_Ordering_System/admin/`
- **Username**: `admin`
- **Password**: `admin123`
- *(Alternate Admin)*: `admin_1` / `admin@nmims`

---

## 👥 Development Team

Developed as a Software Engineering project at **Mukesh Patel Technology Park, NMIMS Shirpur**:

- **Soham** — [soham@nmims.edu](mailto:soham@nmims.edu)
- **Preet** — [preet@nmims.edu](mailto:preet@nmims.edu)
- **Uditya** — [uditya@nmims.edu](mailto:uditya@nmims.edu)

---

## 📄 License
This project is developed for educational and academic purposes under the Software Engineering curriculum at SVKM's NMIMS MPTP Shirpur.
