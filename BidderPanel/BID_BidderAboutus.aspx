<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Default/BidderMasterWithoutLogin.master" AutoEventWireup="true" CodeFile="BID_BidderAboutus.aspx.cs" Inherits="BidderPanel_BID_BidderAboutus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <%--<link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">--%>
    <style>
        body {
            /*  font-family: 'Poppins', sans-serif;*/
            color: #333;
            background: #f8f9fa;
            line-height: 1.6;
        }

        /* Hero Section */
        .hero-section {
            background: linear-gradient(135deg, #5C9BD1 0%, #4c87b9 100%);
            padding: 80px 20px 60px;
            text-align: center;
            margin-top: -20px;
        }

        .hero-content h1 {
            font-size: 48px;
            font-weight: 700;
            margin-bottom: 15px;
            animation: fadeInDown 0.8s;
        }

        .hero-content p {
            font-size: 18px;
            opacity: 0.95;
            max-width: 600px;
            margin: 0 auto;
            animation: fadeInUp 0.8s;
        }

        @keyframes fadeInDown {
            from {
                opacity: 0;
                transform: translateY(-30px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Main Content */
        .main-content {
            max-width: 1200px;
            margin: -40px auto 60px;
            padding: 0 20px;
            position: relative;
            z-index: 10;
        }

        .contact-container {
            background: white;
            border-radius: 20px;
            box-shadow: 0 10px 40px rgba(0, 0, 0, 0.1);
            overflow: hidden;
        }

        /* Contact Grid */
        .contact-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 0;
        }

        .contact-card {
            padding: 50px 40px;
            text-align: center;
            border-right: 1px solid #f0f0f0;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

            .contact-card:last-child {
                border-right: none;
            }

            .contact-card::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                height: 4px;
                background: linear-gradient(135deg,#4c87b9 0%, #4c87b9 100%);
                /*#667eea*/
                /*#764ba2*/
                transform: scaleX(0);
                transition: transform 0.3s ease;
            }

            .contact-card:hover::before {
                transform: scaleX(1);
            }

            .contact-card:hover {
                background: #f8f9ff;
            }

        .icon-wrapper {
            width: 80px;
            height: 80px;
            margin: 0 auto 25px;
            background: linear-gradient(135deg, #4c87b9 0%, #4c87b9 100%);
            /*#667eea*/
            /*#764ba2*/
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 35px;
            color: white;
            box-shadow: 0 5px 20px rgba(102, 126, 234, 0.3);
            transition: transform 0.3s ease;
        }

        .contact-card:hover .icon-wrapper {
            transform: scale(1.1) rotateY(360deg);
        }

        .contact-card h3 {
            font-size: 20px;
            font-weight: 600;
            margin-bottom: 15px;
            color: #333;
        }

        .contact-card h2 {
            font-size: 24px;
            font-weight: 700;
            margin-bottom: 20px;
            color: #333;
        }

        .contact-card p {
            font-size: 16px;
            color: #666;
            margin: 8px 0;
        }

        .contact-card a {
            color: #5C9BD1;
            text-decoration: none;
            transition: color 0.3s;
            font-weight: 500;
        }

            .contact-card a:hover {
                color: #764ba2;
            }

        .contact-subtitle {
            color: #999;
            font-size: 14px;
        }

        /* Location and Map Section */
        .location-map-section {
            display: grid;
            grid-template-columns: 1fr 2fr;
            gap: 0;
            border-top: 1px solid #f0f0f0;
        }

        .location-info {
            padding: 60px 40px;
            background: linear-gradient(135deg, #f8f9ff 0%, #e8ebff 100%);
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
            transition: transform 0.3s ease;
        }

            .location-info .icon-wrapper {
                margin-bottom: 30px;
            }

            .location-info h2 {
                font-size: 28px;
                font-weight: 700;
                margin-bottom: 25px;
                color: #333;
            }

            .location-info p {
                font-size: 17px;
                color: #555;
                margin: 10px 0;
                line-height: 1.8;
            }

            .location-info strong {
                color: #5C9BD1;
                font-size: 19px;
            }

        .map-container {
            height: 100%;
            min-height: 450px;
            position: relative;
            overflow: hidden;
        }

            .map-container iframe {
                width: 100%;
                height: 100%;
                border: 0;
                position: absolute;
                top: 0;
                left: 0;
            }

        /* Responsive */
        @media (max-width: 992px) {
            .location-map-section {
                grid-template-columns: 1fr;
            }

            .map-container {
                min-height: 400px;
            }
        }

        @media (max-width: 768px) {
            .hero-content h1 {
                font-size: 32px;
            }

            .hero-content p {
                font-size: 16px;
            }

            .contact-card {
                padding: 40px 30px;
                border-right: none;
                border-bottom: 1px solid #f0f0f0;
            }

                .contact-card:last-child {
                    border-bottom: none;
                }

            .location-info {
                padding: 40px 20px;
            }

            .map-container {
                min-height: 300px;
            }
        }
        /* About Us Styles */
        .about-header {
            text-align: left;
            padding: 60px 40px;
        }

            .about-header h2 {
                font-size: 32px;
                font-weight: 700;
                margin-bottom: 20px;
                 text-align: center;
            }

            .about-header p {
                max-width: 800px;
                margin: 0 auto;
                font-size: 17px;
                color: #555;
            }

        .about-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            border-top: 1px solid #f0f0f0;
        }

        .about-card {
            padding: 50px 40px;
            text-align: center;
            border-right: 1px solid #f0f0f0;
        }

            .about-card:last-child {
                border-right: none;
            }

            .about-card h3 {
                font-size: 22px;
                font-weight: 600;
                margin-bottom: 15px;
            }

            .about-card p {
                font-size: 16px;
                color: #666;
            }

        /* Stats */
        .about-stats {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
            background: linear-gradient(135deg, #5C9BD1 0%, #4c87b9 100%);
            /*#667eea*/
            /*#764ba2*/
            color: #fff;
            text-align: center;
        }

        .stat-box {
            padding: 40px 20px;
        }

            .stat-box h2 {
                font-size: 36px;
                font-weight: 700;
                margin-bottom: 10px;
            }

            .stat-box p {
                font-size: 16px;
                opacity: 0.9;
            }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cphBreadcrumb" runat="Server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="cphPageContent" runat="Server">
    <!--Help Text-->
    <ucHelp:ShowHelp ID="ucHelp" runat="server" />
    <!--Help Text End-->

    <asp:ScriptManager ID="sm" runat="server">
    </asp:ScriptManager>

    <asp:UpdatePanel ID="upBID_Bidder" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
        <Triggers>
        </Triggers>
        <ContentTemplate>
            <!-- Hero Section -->
            <section class="hero-section">
                <div class="hero-content">
                    <h1>About Us</h1>
                    <%--<p>We're here to help and answer any question you might have. We look forward to hearing from you!</p>--%>
                </div>
            </section>

            <!-- Main Content -->
            <main class="main-content">
                <div class="contact-container about-container">

                    <!-- About Header -->
                    <section class="about-header">
                        <h2 >About Tender Management </h2>

                        <p>
                            The Digital Procurement Team at Parul University serves as the centralized digital procurement unit responsible for managing and streamlining the end-to-end tendering process 
                            across the institution and team ensures transparency, efficiency, and compliance in procurement by leveraging structured digital workflows for requirement evaluation, tender 
                            publishing, vendor participation, technical and commercial assessment, and final award processing.
                        </p>
                        <br />

                        <p>
                            Team Operating as a bridge between user departments, vendors, and administrative authorities, 
                            the Digital Procurement Team facilitates standardized tender lifecycle management, vendor coordination and communication, digital documentation and evaluation support, 
                            compliance with institutional procurement policies, and process transparency and audit readiness.
                        </p>
                        <br />
                        
                        <p>
                            Through the adoption of technology-driven procurement practices, the team contributes to improved decision-making, accountability, and timely execution of procurement activities aligned with the operational and strategic needs of the University.
                            The Tender Management Cell plays a vital role in strengthening governance and enabling efficient resource acquisition across academic, administrative, and infrastructure domains.
                        </p>

                    </section>

                    <!-- About Grid -->
                    <section class="about-grid" runat="server" visible="false">

                        <!-- Our Mission -->
                        <div class="about-card">
                            <div class="icon-wrapper">
                                <i class="fa fa-bullseye"></i>
                            </div>
                            <h3>Our Mission</h3>
                            <p>
                                To make successful academic quests through entrepreneurship, research, modernization, and partnerships, thus making PU the finest educational destination.
                            </p>
                        </div>

                        <!-- Our Vision -->
                        <div class="about-card">
                            <div class="icon-wrapper">
                                <i class="fa fa-eye"></i>
                            </div>
                            <h3>Our Vision</h3>
                            <p>
                                To empower individuals through innovative education, foster a culture of inclusivity, and drive impactful research that advances knowledge and serves society.
                            </p>
                        </div>

                        <!-- Our Values -->
                        <div class="about-card">
                            <div class="icon-wrapper">
                                <i class="fa fa-heart"></i>
                            </div>
                            <h3>Our Values</h3>
                            <p>
                                Parul University’s unwavering commitment to shaping future leaders through quality education, innovation, and research. These guiding principles drive us to create an inclusive, dynamic learning environment that fosters growth, empowers students, and contributes to global progress.
                            </p>
                        </div>
                    </section>

                    <!-- Stats Section -->
                    <%--  <section class="about-stats">
                        <div class="stat-box">
                            <h2>50K+</h2>
                            <p>Students</p>
                        </div>
                        <div class="stat-box">
                            <h2>200+</h2>
                            <p>Programs</p>
                        </div>
                        <div class="stat-box">
                            <h2>100+</h2>
                            <p>Global Collaborations</p>
                        </div>
                        <div class="stat-box">
                            <h2>30+</h2>
                            <p>Years of Excellence</p>
                        </div>
                    </section>--%>
                </div>
            </main>

        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="cphScripts" runat="Server">
</asp:Content>
