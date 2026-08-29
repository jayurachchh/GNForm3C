<%@ Page Title="Home" Language="C#" MasterPageFile="~/Default/BidderMasterWithoutLogin.master" AutoEventWireup="true" CodeFile="BID_BidderHome_New.aspx.cs" Inherits="BidderPanel_BID_BidderHome_New" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        :root {
            --primary: #2563eb;
            --primary-dark: #1d4ed8;
            --secondary: #64748b;
            --light: #f8fafc;
            --white: #ffffff;
            --shadow: 0 10px 40px rgba(37,99,235,0.15);
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            line-height: 1.6;
            color: #1e293b;
            background: var(--white);
            overflow-x: hidden;
        }

        /* Premium Header */
        header {
            /*background: rgba(255,255,255,0.95);*/
            /*backdrop-filter: blur(20px);*/
            /*position: fixed;*/
            width: 100%;
            top: 0;
            z-index: 1000;
            /*box-shadow: 0 1px 20px rgba(0,0,0,0.08);*/
            transition: all 0.3s;
        }

        nav {
            max-width: 1400px;
            margin-top: 25px;
            margin-left:280px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 1rem 2.5rem;
        }

        .logo {
            font-size: 3rem;
            font-weight: 900;
            background: linear-gradient(135deg, var(--primary), #3b82f6);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
        }

        .nav-menu {
            display: flex;
            gap: 2.5rem;
            list-style: none;
        }

            .nav-menu a {
                color: #475569;
                text-decoration: none;
                font-weight: 600;
                font-size: 1.9rem;
                transition: color 0.3s;
            }

                .nav-menu a:hover {
                    color: var(--primary);
                }


        /* Hero - Title + Small Cards Beside */
        .hero {
            /*background: linear-gradient(135deg, var(--white) 0%, var(--light) 100%);*/
            /*padding: 140px 2rem 100px;*/
            min-height: 65vh;
            display: flex;
            /*align-items: center;*/
            position: relative;
            overflow: hidden;
        }

            .hero::before {
                content: '';
                position: absolute;
               /* top: 0;
                left: 0;
                right: 0;*/
                height: 400px;
                background: radial-gradient(ellipse at top, rgba(37,99,235,0.05) 0%, transparent 70%);
            }

        .hero-container {
            /*max-width: 1400px;*/
            margin-top: 50px;
            margin-left:60px;
            display: grid;
            grid-template-columns: 1fr 400px;
            gap: 50rem;
            /*align-items: center;*/
            position: relative;
            z-index: 2;
        }

        .hero-content h1 {
            font-size: 4rem;
            font-weight: 800;
            line-height: 1.25;
            margin-bottom: 1.5rem;
            background: linear-gradient(135deg, #1e293b, #334155);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            letter-spacing: -0.02em;
        }

        .hero-subtitle {
            font-size: 1.7rem;
            color: var(--secondary);
            margin-bottom: 2rem;
            max-width: 600px;
        }

        .trust-badges {
            display: flex;
            gap: 2rem;
            margin-top: 2rem;
        }

        .badges {
            display: flex;
            align-items: center;
            gap: 0.6rem;
            font-size: 1.5rem;
            font-weight: 600;
            color: var(--primary);
        }

        /* Small Portal Cards Beside Hero Title */
        .portal-grid {
            display: flex;
            flex-direction: column;
            gap: 1.0rem;
        }

        .portal-card {
            background: var(--white);
            padding: 1.8rem 1.2rem;
            border-radius: 20px;
            box-shadow: var(--shadow);
            transition: all 0.4s cubic-bezier(0.4,0,0.2,1);
            border: 1px solid rgba(37,99,235,0.1);
            text-decoration: none;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            height: 90px;
        }

            .portal-card:hover {
                transform: translateY(-10px) scale(1.02);
                box-shadow: 0 25px 60px rgba(37,99,235,0.25);
                border-color: var(--primary);
            }

        .portal-icon {
            width: 55px;
            height: 50px;
            background: linear-gradient(135deg, var(--primary), #3b82f6);
            border-radius: 14px;
            display: flex;
            align-items: center;
            justify-content: center;
            flex-shrink: 0;
        }

            .portal-icon i {
                font-size: 1.6rem;
                color: var(--white);
            }

        .portal-text h3 {
            font-size: 1.6rem;
            font-weight: 700;
            color: #1e293b;
            /*margin-bottom: 0.2rem;*/
        }

        .portal-text p {
            font-size: 1.5rem;
            color: var(--secondary);
        }

        /* Sections */
        section {
            /*padding: 100px 2rem;*/
        }

        .container {
            max-width: 1400px;
            margin: 0 auto;
        }

        .section-header {
            text-align: center;
            margin-bottom: 5rem;
        }

        .section-badge {
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
            background: linear-gradient(135deg, var(--primary), #3b82f6);
            color: var(--white);
            padding: 0.6rem 1.8rem;
            border-radius: 50px;
            font-size: 1.5rem;
            font-weight: 600;
            margin-bottom: 1.5rem;
            box-shadow: var(--shadow);
        }

        .section-header h2 {
            font-size: 4rem;
            font-weight: 800;
            color: #1e293b;
            line-height: 1.1;
            letter-spacing: -0.02em;
        }

        .section-header p {
            font-size: 1.2rem;
            color: var(--secondary);
            max-width: 600px;
            margin: 0 auto;
        }

        /* Opportunities - Compact Cards */
        .opportunities-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(350px, 1fr));
            gap: 2rem;
        }

        .opp-card {
            background: var(--white);
            border-radius: 24px;
            overflow: hidden;
            box-shadow: var(--shadow);
            transition: all 0.4s;
            border: 1px solid rgba(37,99,235,0.1);
        }

            .opp-card:hover {
                transform: translateY(-12px);
                box-shadow: 0 30px 80px rgba(37,99,235,0.2);
            }

        .opp-header {
            padding: 2rem;
            background: linear-gradient(135deg, var(--light), var(--white));
            text-align: center;
        }

        .opp-title {
            font-size: 1.4rem;
            font-weight: 700;
            color: #1e293b;
            margin-bottom: 1rem;
        }

        .opp-meta {
            display: flex;
            gap: 1rem;
        }

        .meta {
            flex: 1;
            padding: 1rem;
            background: rgba(37,99,235,0.05);
            border-radius: 12px;
            text-align: center;
        }

        .meta-label {
            font-size: 0.8rem;
            color: var(--secondary);
            font-weight: 600;
        }

        .meta-value {
            font-size: 1.1rem;
            font-weight: 700;
            color: var(--primary);
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 0.3rem;
        }

        .btn-primary {
            display: block;
            width: 100%;
            padding: 1.2rem;
            background: linear-gradient(135deg, var(--primary), #3b82f6);
            color: var(--white);
            text-decoration: none;
            text-align: center;
            font-weight: 600;
            border-radius: 0 0 24px 24px;
            transition: all 0.3s;
        }

            .btn-primary:hover {
                transform: translateY(-2px);
                box-shadow: var(--shadow);
            }

        /* PREMIUM CONTACT SECTION - NEW DESIGN */
        .premium-contact {
            background: linear-gradient(135deg, var(--light) 0%, var(--white) 100%);
            border-radius: 32px;
            padding: 4rem;
            box-shadow: var(--shadow);
            margin: 2rem 0;
            position: relative;
            overflow: hidden;
        }

            .premium-contact::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                height: 6px;
                background: linear-gradient(135deg, var(--primary), #3b82f6);
            }

        .contact-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 3rem;
            align-items: start;
        }

        .contact-card {
            background: var(--white);
            padding: 3rem 2.5rem;
            border-radius: 24px;
            box-shadow: 0 15px 50px rgba(37,99,235,0.08);
            text-align: center;
            transition: all 0.4s cubic-bezier(0.4,0,0.2,1);
            border: 1px solid rgba(37,99,235,0.1);
            position: relative;
            overflow: hidden;
        }

            .contact-card::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                height: 4px;
                background: linear-gradient(135deg, var(--primary), #3b82f6);
                transform: scaleX(0);
                transition: transform 0.4s ease;
            }

            .contact-card:hover::before {
                transform: scaleX(1);
            }

            .contact-card:hover {
                transform: translateY(-15px);
                box-shadow: 0 30px 80px rgba(37,99,235,0.2);
                border-color: var(--primary);
            }

        .contact-icon {
            width: 90px;
            height: 90px;
            background: linear-gradient(135deg, var(--primary), #3b82f6);
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 1.5rem;
            font-size: 2.2rem;
            color: var(--white);
            box-shadow: 0 15px 40px rgba(37,99,235,0.3);
            transition: all 0.5s;
        }

        .contact-card:hover .contact-icon {
            transform: scale(1.15) rotate(360deg);
            box-shadow: 0 25px 60px rgba(37,99,235,0.4);
        }

        .contact-card h3 {
            font-size: 1.5rem;
            font-weight: 800;
            color: #1e293b;
            margin-bottom: 1rem;
        }

        .contact-link {
            display: block;
            font-size: 1.4rem;
            font-weight: 700;
            color: var(--primary);
            text-decoration: none;
            margin: 1rem 0;
            padding: 0.8rem 1rem;
            border-radius: 12px;
            transition: all 0.3s;
        }

            .contact-link:hover {
                background: rgba(37,99,235,0.08);
                transform: translateX(10px);
                color: var(--primary-dark);
            }

        .contact-subtitle {
            color: var(--secondary);
            font-size: 0.95rem;
            font-weight: 500;
        }

        .location-card {
            grid-column: 1 / -1;
            display: flex;
            gap: 4rem;
            align-items: center;
            padding-top: 3rem;
            border-top: 2px solid rgba(37,99,235,0.1);
        }

        @media (max-width: 1024px) {
            .location-card {
                flex-direction: column;
                text-align: center;
                gap: 2rem;
            }
        }

        .location-info {
            flex: 1;
        }

            .location-info h3 {
                font-size: 1.8rem;
                color: var(--primary);
                margin-bottom: 1.5rem;
                display: flex;
                align-items: center;
                gap: 0.8rem;
            }

        .location-address p {
            font-size: 1.1rem;
            color: #475569;
            margin-bottom: 0.8rem;
            line-height: 1.6;
        }

        .location-address strong {
            color: #1e293b;
            font-weight: 700;
            font-size: 1.2rem;
        }

        .map-container {
            flex: 1.5;
            height: 400px;
            border-radius: 20px;
            overflow: hidden;
            box-shadow: 0 20px 60px rgba(37,99,235,0.15);
            transition: all 0.4s;
        }

            .map-container:hover {
                transform: scale(1.02);
            }

            .map-container iframe {
                width: 100%;
                height: 100%;
                border: 0;
            }

        /* About */
        .about-grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 4rem;
            align-items: center;
        }

        .about-text p {
            font-size: 1.1rem;
            margin-bottom: 1.5rem;
            color: #475569;
        }

        /* Footer */
        footer {
            background: #0f172a;
            color: #94a3b8;
            padding: 4rem 2rem 2rem;
            text-align: center;
        }

        .footer-content {
            max-width: 1200px;
            margin: 0 auto 2rem;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 2rem;
        }

        .footer-section h3 {
            color: var(--white);
            margin-bottom: 1rem;
            font-size: 1.2rem;
        }

        .footer-section a {
            color: #94a3b8;
            text-decoration: none;
            display: block;
            margin-bottom: 0.5rem;
            transition: color 0.3s;
        }

            .footer-section a:hover {
                color: var(--primary);
            }

        /* Responsive */
        @media (max-width: 1024px) {
            .hero-container {
                grid-template-columns: 1fr;
                text-align: center;
            }

            .about-grid {
                grid-template-columns: 1fr;
            }

            .contact-grid {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 768px) {
            .nav-menu {
                display: none;
            }

            .hero h1 {
                font-size: 2.8rem;
            }

            .section-header h2 {
                font-size: 2.2rem;
            }

            .premium-contact {
                padding: 2rem 1rem;
            }

            .contact-card {
                padding: 2rem 1.5rem;
            }

            .location-card {
                flex-direction: column;
            }

            .map-container {
                height: 300px;
            }
        }


 
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cphBreadcrumb" runat="Server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="cphPageContent" runat="Server">
    <asp:ScriptManager ID="sm" runat="server"></asp:ScriptManager>

    <asp:UpdatePanel ID="upBID_Home" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
        <ContentTemplate>
            <body>
                <header runat="server" visible="false">
                    <nav>
                        <div class="logo">TenderMS</div>
                        <ul class="nav-menu">
                            <li><a href="#home">Home</a></li>
                            <li><a href="#tenders">Tenders</a></li>
                            <li><a href="#about">About</a></li>
                            <li><a href="#contact">Contact</a></li>
                        </ul>
                        <a href="#signin" class="header-cta">Get Started</a>
                    </nav>
                </header>

                <section id="home" class="hero">
                    <div class="hero-container">
                        <div class="hero-content">
                            <h1>Tender Management System</h1>
                            <p class="hero-subtitle">Streamlined e-procurement platform for transparent bidding, supplier management, and efficient tender processing. Join 5000+ trusted organizations.</p>
                            <div class="trust-badges">
                                <div class="badges"><i class="fas fa-lock"></i>Secure & Compliant</div>
                                <div class="badges"><i class="fas fa-shield-alt"></i>99.9% Uptime</div>
                                <div class="badges"><i class="fas fa-users"></i>10K+ Bidders</div>
                            </div>
                        </div>
                        <div class="portal-grid">
                            <a href="#signin" class="portal-card">
                                <div class="portal-icon"><i class="fas fa-sign-in-alt"></i></div>
                                <div class="portal-text">
                                    <h3>Sign In</h3>
                                    <p>Access dashboard</p>
                                </div>
                            </a>
                            <a href="#register" class="portal-card">
                                <div class="portal-icon"><i class="fas fa-user-plus"></i></div>
                                <div class="portal-text">
                                    <h3>Register</h3>
                                    <p>Create free account</p>
                                </div>
                            </a>
                            <a href="#tenders" class="portal-card">
                                <div class="portal-icon"><i class="fas fa-file-contract"></i></div>
                                <div class="portal-text">
                                    <h3>Apply Tenders</h3>
                                    <p>Browse & bid now</p>
                                </div>
                            </a>
                        </div>
                    </div>
                </section>

                    <section id="tenders" class="container">
        <div class="section-header">
            <span class="section-badge"><i class="fas fa-bolt"></i> Live Opportunities</span>
            <h2>Active Tenders</h2>
            <p>Browse verified tenders from government and corporate sectors.</p>
        </div>
        <div class="opportunities-grid">
            <div class="opp-card">
                <div class="opp-header">
                    <h3>Tender-001: Infrastructure Project</h3>
                </div>
                <div style="padding: 1.5rem;">
                    <div class="opp-meta">
                        <div class="meta">
                            <div class="meta-label">Deadline</div>
                            <div class="meta-value">7 Days <i class="fas fa-clock"></i></div>
                        </div>
                        <div class="meta">
                            <div class="meta-label">Value</div>
                            <div class="meta-value">₹5 Cr <i class="fas fa-inr"></i></div>
                        </div>
                    </div>
                </div>
                <a href="#" class="btn-primary">View & Apply</a>
            </div>
            <div class="opp-card">
                <div class="opp-header">
                    <h3>Tender-002: IT Services</h3>
                </div>
                <div style="padding: 1.5rem;">
                    <div class="opp-meta">
                        <div class="meta">
                            <div class="meta-label">Deadline</div>
                            <div class="meta-value">15 Days <i class="fas fa-clock"></i></div>
                        </div>
                        <div class="meta">
                            <div class="meta-label">Value</div>
                            <div class="meta-value">₹2 Cr <i class="fas fa-inr"></i></div>
                        </div>
                    </div>
                </div>
                <a href="#" class="btn-primary">View & Apply</a>
            </div>
            <div class="opp-card">
                <div class="opp-header">
                    <h3>Tender-003: Supplies</h3>
                </div>
                <div style="padding: 1.5rem;">
                    <div class="opp-meta">
                        <div class="meta">
                            <div class="meta-label">Deadline</div>
                            <div class="meta-value">3 Days <i class="fas fa-clock"></i></div>
                        </div>
                        <div class="meta">
                            <div class="meta-label">Value</div>
                            <div class="meta-value">₹1 Cr <i class="fas fa-inr"></i></div>
                        </div>
                    </div>
                </div>
                <a href="#" class="btn-primary">View & Apply</a>
            </div>
        </div>
    </section>

    <section id="about" class="container" style="background: var(--light);">
        <div class="section-header">
            <span class="section-badge">Why Choose Us</span>
            <h2>Enterprise-Grade Tender Platform</h2>
            <p>Built for scale with AI-driven matching and blockchain security.</p>
        </div>
        <div class="about-grid">
            <div class="about-text">
                <p>Transform procurement with our end-to-end solution: automated tender publishing, real-time bidding, and analytics dashboard. Reduce cycle time by 70%.</p>
                <p>Compliant with GST/e-Tender norms, serving PSUs and corporates across India.</p>
            </div>
            <div style="text-align: center;">
                <i class="fas fa-rocket" style="font-size: 12rem; color: rgba(37,99,235,0.1);"></i>
            </div>
        </div>
    </section>

    <!-- PERFECT PREMIUM CONTACT SECTION -->
    <section id="contact" class="container">
        <div class="section-header">
            <span class="section-badge"><i class="fas fa-envelope"></i> Get In Touch</span>
            <h2>Complete Support Center</h2>
            <p>Multiple channels for instant assistance with tender registration, bidding, and technical queries.</p>
        </div>
        
        <div class="premium-contact">
            <div class="contact-grid">
                <!-- Email Card -->
                <div class="contact-card">
                    <div class="contact-icon">
                        <i class="fas fa-envelope"></i>
                    </div>
                    <h3>Email Support</h3>
                    <a href="mailto:admin@srmhub.com" class="contact-link">
                        admissions@paruluniversity.ac.in
                    </a>
                    <p class="contact-subtitle">Response within 24 hours</p>
                </div>

                <!-- Phone Card -->
                <div class="contact-card">
                    <div class="contact-icon">
                        <i class="fas fa-phone"></i>
                    </div>
                    <h3>Phone Support</h3>
                    <a href="tel:+919558210145" class="contact-link">
                        +91 95582 10145
                    </a>
                    <p class="contact-subtitle">Mon-Fri 9AM-6PM</p>
                </div>

<div class="contact-card">
                    <div class="contact-icon">
                        <i class="fas fa-comments"></i>
                    </div>
                    <h3>Live Support</h3>
                    <a href="tel:+919558210145" class="contact-link">
                        +91 95582 10145
                    </a>
                    <p class="contact-subtitle">Chat with our team instantly</p>
                </div>

                <!-- Location + Map Card -->
                <div class="contact-card location-card">
                    <div class="location-info">
                        <h3><i class="fas fa-map-marker-alt"></i> Corporate Office</h3>
                        <div class="location-address">
                            <p><strong>Parul University</strong></p>
                            <p>P.O. Limda, Ta. Waghodia - 391760</p>
                            <p>Dist. Vadodara, Gujarat (India)</p>
                        </div>
                    </div>
                    <div class="map-container">
                        <iframe 
                            src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3690.022687538395!2d73.36125731495504!3d22.288720299999998!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3959da2400193173%3A0xc3190c237f2928e8!2sParul%20University!5e0!3m2!1sen!2sin!4v1738775000000!5m2!1sen!2sin" 
                            allowfullscreen="" 
                            loading="lazy" 
                            referrerpolicy="no-referrer-when-click">
                        </iframe>
                    </div>
                </div>
            </div>
        </div>
    </section>
            </body>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="cphScripts" runat="Server">
    <script>
        // Smooth scrolling & active nav
        document.querySelectorAll('a[href^="#"]').forEach(link => {
            link.addEventListener('click', e => {
                e.preventDefault();
                const target = document.querySelector(link.getAttribute('href'));
                if (target) {
                    target.scrollIntoView({ behavior: 'smooth', block: 'start' });
                }
            });
        });

        // Header scroll effect
        window.addEventListener('scroll', () => {
            document.querySelector('header').style.background = window.scrollY > 50 ? 'rgba(255,255,255,0.98)' : 'rgba(255,255,255,0.95)';
        });

        // Contact card hover animations
        document.querySelectorAll('.contact-card').forEach(card => {
            card.addEventListener('mouseenter', () => {
                card.style.transform = 'translateY(-15px)';
            });
            card.addEventListener('mouseleave', () => {
                card.style.transform = 'translateY(0)';
            });
        });
    </script>
</asp:Content>
