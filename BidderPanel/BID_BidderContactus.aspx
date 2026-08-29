<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/Default/BidderMasterWithoutLogin.master" AutoEventWireup="true" CodeFile="BID_BidderContactus.aspx.cs" Inherits="BidderPanel_BID_BidderContactus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        body {
            color: #333;
            background: #f8f9fa;
            line-height: 1.6;
        }

        /* Hero Section */
        .hero-section {
            background: linear-gradient(135deg, #5C9BD1 0%, #4c87b9 100%);
            /*#667eea*/
            /*#764ba2*/
            color: white;
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
                background: linear-gradient(135deg, #4c87b9 0%, #4c87b9 100%);
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
            background: linear-gradient(135deg,#4c87b9 0%, #4c87b9 100%);
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
            color: #4c87b9;
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
            background: linear-gradient(135deg, 0%, 100%);
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
                color: #4c87b9;
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
                    <h1>Contact Us</h1>
                    <p>We're here to help and answer any question you might have. We look forward to hearing from you!</p>
                </div>
            </section>

            <!-- Main Content -->
            <main class="main-content">
                <div class="contact-container">
                    <!-- Message Display -->
                    <ucMessage:ShowMessage ID="ucMessageTender" runat="server" ViewStateMode="Disabled" />

                    <!-- Contact Cards Grid -->
                    <div class="contact-grid">
                        <!-- Phone -->
                        <div class="contact-card">
                            <div class="icon-wrapper">
                                <i class="fa fa-phone"></i>
                            </div>
                            <h3>Call Us</h3>
                            <p>
                                <a href="tel:+919558210145">
                                    <asp:Label ID="lblContactNo" runat="server" Text="+91 98562 34185"></asp:Label>
                                </a>
                            </p>
                            <p class="contact-subtitle">Mon-Fri 9am-6pm</p>
                        </div>

                        <!-- Email -->
                        <div class="contact-card">
                            <div class="icon-wrapper">
                                <i class="fa fa-envelope"></i>
                            </div>
                            <h3>Email Us</h3>
                            <p>
                                <a href="mailto:admin@srmhub.com">
                                    <asp:Label ID="lblEmail" runat="server" Text="admissions@paruluniversity.ac.in "></asp:Label>
                                </a>
                            </p>
                            <p class="contact-subtitle">We'll respond within 24 hours</p>
                        </div>

                        <!-- Support -->
                        <div class="contact-card">
                            <div class="icon-wrapper">
                                <i class="fa fa-comment"></i>
                            </div>
                            <h3>Live Support</h3>
                            <p>
                                <a href="tel:+919558210145">
                                    <asp:Label ID="lblMessage" runat="server" Text="+91 95582 10145"></asp:Label>
                                </a>
                            </p>
                            <p class="contact-subtitle">Chat with our team</p>
                        </div>
                    </div>

                    <!-- Location and Map Section (Side by Side) -->
                    <div class="location-map-section">
                        <!-- Location Info (Left Side) -->
                        <div class="location-info contact-card">
                            <div class="icon-wrapper">
                                <i class="fa fa-map-marker"></i>
                            </div>
                            <h2>Visit Our Campus</h2>
                            <p>
                                <strong>
                                    <asp:Label ID="lblAddress" runat="server" Text="Parul University"></asp:Label>
                                </strong>
                            </p>
                            <p>
                                <asp:Label ID="lblAddressLine1" runat="server" Text="P.O. Limda, Ta. Waghodia - 391760"></asp:Label>
                            </p>
                            <p>
                                <asp:Label ID="lblAddressLine2" runat="server" Text="Dist. Vadodara, Gujarat (India)"></asp:Label>
                            </p>
                        </div>

                        <!-- Google Map (Right Side) -->
                        <div class="map-container">
                            <%--<iframe
                                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3690.4997867574443!2d73.30471931495484!3d22.363157985297668!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x395fc8ab91a3ddab%3A0xac39d3bfe1473fb8!2sParul%20University!5e0!3m2!1sen!2sin!4v1234567890123!5m2!1sen!2sin"
                                allowfullscreen=""
                                loading="lazy"
                                referrerpolicy="no-referrer-when-downgrade">
                            </iframe>--%>
                            <iframe
                                src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3690.022687538395!2d73.36125731495504!3d22.288720299999998!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3959da2400193173%3A0xc3190c237f2928e8!2sParul%20University!5e0!3m2!1sen!2sin!4v1738775000000!5m2!1sen!2sin"
                                allowfullscreen=""
                                loading="lazy"
                                referrerpolicy="no-referrer-when-downgrade"></iframe>
                        </div>
                    </div>
                </div>
            </main>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="cphScripts" runat="Server">
    <script>
        // Smooth scroll animations
        $(document).ready(function () {
            console.log('Contact page loaded successfully');

            // Add any additional interactive features here
        });
    </script>
</asp:Content>
