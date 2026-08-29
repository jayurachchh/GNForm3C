<%@ Page Title="Home" Language="C#" MasterPageFile="~/Default/BidderMasterWithoutLogin.master" AutoEventWireup="true" CodeFile="BID_BidderHome.aspx.cs" Inherits="BidderPanel_BID_BidderHome" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            color: #1a1a1a;
            background: #ffffff;
            line-height: 1.6;
            overflow-x: hidden;
        }

        /* ===================================
           REDESIGNED HERO SECTION
           =================================== */
        .hero-section {
            background: linear-gradient(to bottom, #ffffff 0%, #f8fafc 100%);
            padding: 80px 20px 120px;
            position: relative;
            overflow: hidden;
        }

            .hero-section::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                height: 400px;
                background: radial-gradient(ellipse at top center, rgba(0, 0, 0, 0.03) 0%, transparent 70%);
                pointer-events: none;
            }

        .hero-container {
            max-width: 1400px;
            margin: 0 auto;
            position: relative;
            z-index: 2;
        }

        .hero-top {
            text-align: center;
            margin-bottom: 80px;
        }

        .hero-content {
            max-width: 900px;
            margin: 0 auto;
            animation: fadeInUp 1s ease-out;
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

        .hero-title {
            font-size: 56px;
            font-weight: 900;
            color: #0f172a;
            line-height: 1.2;
            margin-bottom: 24px;
            letter-spacing: -1px;
        }

            .hero-title .highlight {
                background: linear-gradient(135deg, #4c87b9 0%, #4c87b9 100%);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                background-clip: text;
                display: inline-block;
            }

        .hero-description {
            font-size: 20px;
            color: #64748b;
            line-height: 1.8;
            margin-bottom: 0;
            max-width: 800px;
            margin: 0 auto;
        }

        /* Portal Cards Grid - BLACK THEME */
        .portal-cards-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(320px, 1fr));
            gap: 32px;
            max-width: 1200px;
            margin: 0 auto;
        }

        .portal-card {
            background: white;
            padding: 40px 32px;
            border-radius: 24px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.06);
            transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
            position: relative;
            overflow: hidden;
            border: 1px solid rgba(0, 0, 0, 0.05);
            cursor: pointer;
            text-align: center;
            text-decoration: none;
            display: block;
        }

            .portal-card::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                height: 5px;
                background: linear-gradient(90deg, #4c87b9, #4c87b9);
                transform: scaleX(0);
                transition: transform 0.4s cubic-bezier(0.4, 0, 0.2, 1);
            }

            .portal-card:hover::before {
                transform: scaleX(1);
            }

            .portal-card:hover {
                transform: translateY(-12px);
                box-shadow: 0 20px 50px rgba(0, 0, 0, 0.15);
                border-color: rgba(0, 0, 0, 0.1);
            }

        .portal-icon-box {
            width: 80px;
            height: 80px;
            background: linear-gradient(135deg, #4c87b9 0%, #4c87b9 100%);
            border-radius: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto 28px;
            transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.3);
        }

        .portal-card:hover .portal-icon-box {
            transform: rotateY(360deg) scale(1.1);
            box-shadow: 0 12px 35px rgba(0, 0, 0, 0.4);
        }

        .portal-icon-box i {
            font-size: 36px;
            color: white;
        }

        .portal-content h3 {
            font-size: 22px;
            font-weight: 700;
            color: #0f172a;
            margin-bottom: 12px;
            transition: color 0.3s ease;
        }

        .portal-card:hover .portal-content h3 {
            color: #000000;
        }

        .portal-content p {
            font-size: 15px;
            color: #64748b;
            line-height: 1.7;
        }

        /* ===================================
           MODERN OPPORTUNITIES SECTION - SWIPEABLE
           =================================== */

        .opportunities-section {
            padding: 120px 20px;
            background: linear-gradient(to bottom, #ffffff 0%, #f8fafc 100%);
            position: relative;
        }

            /* Decorative Elements */
            .opportunities-section::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                height: 300px;
                background: radial-gradient(ellipse at top, rgba(0, 0, 0, 0.02) 0%, transparent 70%);
            }

        .opportunities-container {
            max-width: 1400px;
            margin: 0 auto;
            position: relative;
        }

        .section-header-inline {
            display: flex;
            justify-content: space-between;
            align-items: flex-end;
            margin-bottom: 60px;
        }

        .section-title-group {
            flex: 1;
        }

        .section-subtitle {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            color: #4c87b9;
            font-size: 14px;
            font-weight: 700;
            text-transform: uppercase;
            letter-spacing: 1.5px;
            margin-bottom: 16px;
        }

            .section-subtitle i {
                font-size: 12px;
                animation: pulse 2s ease infinite;
            }

        @keyframes pulse {
            0%, 100% {
                opacity: 1;
            }

            50% {
                opacity: 0.5;
            }
        }

        .section-header-inline h2 {
            font-size: 48px;
            font-weight: 900;
            background: linear-gradient(135deg, #4c87b9 0%, #4c87b9 100%);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            margin-bottom: 16px;
            letter-spacing: -1px;
        }

        .section-description {
            font-size: 18px;
            color: #64748b;
            max-width: 600px;
        }

        .view-all-link {
            padding: 16px 32px;
            background: #4c87b9;
            color: white;
            border: 2px solid #4c87b9;
            border-radius: 16px;
            font-size: 15px;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
            text-decoration: none;
        }

            .view-all-link:hover {
                background: #4c87b9;
                color: white;
                border-color: #4c87b9;
                transform: translateY(-3px);
                box-shadow: 0 10px 30px rgba(0, 0, 0, 0.3);
            }

            .view-all-link i {
                transition: transform 0.3s ease;
            }

            .view-all-link:hover i {
                transform: translateX(5px);
            }

        /* Swipeable Opportunities Container */
        .opportunities-wrapper {
            position: relative;
            overflow: hidden;
            margin: 0 -70px;
            padding: 0 0px;
        }

        .opportunities-grid {
            display: flex;
            gap: 32px;
            overflow-x: auto;
            scroll-behavior: smooth;
            scrollbar-width: none; /* Firefox */
            -ms-overflow-style: none; /* IE and Edge */
            padding: 10px 0 30px 0;
        }

            .opportunities-grid::-webkit-scrollbar {
                display: none; /* Chrome, Safari, Opera */
            }

        .opportunity-item {
            flex: 0 0 360px;
            background: white;
            border-radius: 24px;
            overflow: hidden;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.04);
            transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
            position: relative;
            border: 1px solid rgba(0, 0, 0, 0.05);
        }

            .opportunity-item::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                height: 5px;
                background: linear-gradient(90deg, #4c87b9, #4c87b9);
                transform: scaleX(0);
                transform-origin: left;
                transition: transform 0.4s cubic-bezier(0.4, 0, 0.2, 1);
            }

            .opportunity-item:hover::before {
                transform: scaleX(1);
            }

            .opportunity-item:hover {
                transform: translateY(-12px);
                box-shadow: 0 30px 60px rgba(0, 0, 0, 0.15);
            }

        /* Scroll Indicators */
        .scroll-indicator {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            width: 50px;
            height: 50px;
            background: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            cursor: pointer;
            z-index: 10;
            transition: all 0.3s ease;
            border: 2px solid rgba(0, 0, 0, 0.05);
        }

            .scroll-indicator:hover {
                background: #000000;
                color: white;
                box-shadow: 0 8px 30px rgba(0, 0, 0, 0.2);
            }

            .scroll-indicator.left {
                left: -25px;
            }

            .scroll-indicator.right {
                right: -25px;
            }

            .scroll-indicator i {
                font-size: 20px;
                color: #000000;
                transition: color 0.3s ease;
            }

            .scroll-indicator:hover i {
                color: white;
            }

        /* Status Badge */
        .opportunity-ribbon {
            position: absolute;
            top: 24px;
            right: 24px;
            padding: 8px 16px;
            background: linear-gradient(135deg, #fbbf24, #f59e0b);
            color: white;
            font-size: 11px;
            font-weight: 800;
            text-transform: uppercase;
            letter-spacing: 1px;
            border-radius: 100px;
            box-shadow: 0 4px 15px rgba(251, 191, 36, 0.4);
            z-index: 10;
            display: flex;
            align-items: center;
            gap: 6px;
        }

            .opportunity-ribbon i {
                font-size: 10px;
                animation: sparkle 1.5s ease infinite;
            }

        @keyframes sparkle {
            0%, 100% {
                transform: scale(1);
                opacity: 1;
            }

            50% {
                transform: scale(1.2);
                opacity: 0.7;
            }
        }

        /* Company Header */
        .opportunity-logo {
            padding: 40px 32px;
            background: linear-gradient(135deg, #f8fafc 0%, #f1f5f9 100%);
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
            min-height: 180px;
            justify-content: center;
            border-bottom: 1px solid rgba(0, 0, 0, 0.05);
            position: relative;
            overflow: hidden;
        }

            .opportunity-logo::before {
                content: '';
                position: absolute;
                top: -50%;
                left: -50%;
                width: 200%;
                height: 200%;
                background: radial-gradient(circle, rgba(0, 0, 0, 0.02) 0%, transparent 70%);
                animation: rotate 20s linear infinite;
            }

        @keyframes rotate {
            from {
                transform: rotate(0deg);
            }

            to {
                transform: rotate(360deg);
            }
        }

        .company-logo-box {
            width: 100px;
            height: 100px;
            background: white;
            border-radius: 20px;
            display: flex;
            align-items: center;
            justify-content: center;
            margin-bottom: 16px;
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.08);
            position: relative;
            z-index: 1;
            border: 2px solid rgba(0, 0, 0, 0.05);
        }

        .opportunity-logo img {
            max-width: 70px;
            max-height: 70px;
            object-fit: contain;
        }

        .company-name {
            font-size: 14px;
            font-weight: 700;
            color: #64748b;
            text-transform: uppercase;
            letter-spacing: 1px;
            position: relative;
            z-index: 1;
        }

        /* Card Content */
        .opportunity-content {
            padding: 32px;
        }

        .opportunity-title {
            font-size: 18px;
            font-weight: 700;
            color: #0f172a;
            line-height: 1.6;
            margin-bottom: 24px;
            min-height: 60px;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }

        /* Meta Info */
        .opportunity-meta-info {
            display: flex;
            gap: 12px;
            margin-bottom: 24px;
        }

        .meta-item {
            flex: 1;
            padding: 12px;
            background: #f8fafc;
            border-radius: 12px;
            border: 1px solid #e2e8f0;
        }

        .meta-label {
            font-size: 11px;
            color: #64748b;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            font-weight: 600;
            margin-bottom: 4px;
        }

        .meta-value {
            font-size: 14px;
            font-weight: 700;
            color: #0f172a;
            display: flex;
            align-items: center;
            gap: 6px;
        }

            .meta-value i {
                color: #000000;
                font-size: 12px;
            }

            .meta-value.urgent {
                color: #dc2626;
            }

                .meta-value.urgent i {
                    color: #dc2626;
                }

        /* Action Button */
        .view-details-btn {
            width: 100%;
            padding: 16px;
            background: linear-gradient(135deg, #4c87b9 0%, #4c87b9 100%);
            color: white;
            border: none;
            border-radius: 14px;
            font-size: 15px;
            font-weight: 700;
            cursor: pointer;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 10px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.3);
            position: relative;
            overflow: hidden;
            text-decoration: none;
        }

            .view-details-btn::before {
                content: '';
                position: absolute;
                inset: 0;
                background: linear-gradient(135deg, #5C9BD1 0%, #4c87b9 100%);
                opacity: 0;
                transition: opacity 0.3s ease;
            }

            .view-details-btn:hover::before {
                opacity: 1;
            }

            .view-details-btn span {
                position: relative;
                z-index: 1;
            }

            .view-details-btn i {
                position: relative;
                z-index: 1;
                transition: transform 0.3s ease;
            }

            .view-details-btn:hover {
                transform: translateY(-2px);
                box-shadow: 0 12px 30px rgba(0, 0, 0, 0.4);
                color: white;
            }

                .view-details-btn:hover i {
                    transform: translateX(5px);
                }

        /* Features Section */
        .features-section {
            padding: 100px 20px;
            background: white;
        }

        .section-header {
            text-align: center;
            max-width: 800px;
            margin: 0 auto 60px;
        }

        .section-badge {
            display: inline-block;
            background: #4c87b9;
            color: white;
            padding: 8px 20px;
            border-radius: 50px;
            font-size: 14px;
            font-weight: 600;
            margin-bottom: 20px;
        }

        .section-header h2 {
            font-size: 42px;
            font-weight: 700;
            margin-bottom: 20px;
            color: #4c87b9;
        }

        .section-header p {
            font-size: 18px;
            color: #666;
            line-height: 1.8;
        }

        .features-grid {
            max-width: 1200px;
            margin: 0 auto;
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 30px;
        }

        .feature-card {
            background: white;
            padding: 40px 30px;
            border-radius: 20px;
            box-shadow: 0 5px 20px rgba(0, 0, 0, 0.08);
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
        }

            .feature-card::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                height: 4px;
                background: #4c87b9;
                transform: scaleX(0);
                transition: transform 0.3s ease;
            }

            .feature-card:hover::before {
                transform: scaleX(1);
            }

            .feature-card:hover {
                transform: translateY(-10px);
                box-shadow: 0 15px 40px rgba(0, 0, 0, 0.15);
            }

        .feature-icon {
            width: 70px;
            height: 70px;
            background: #4c87b9;
            border-radius: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 32px;
            color: white;
            margin-bottom: 25px;
            transition: transform 0.3s ease;
        }

        .feature-card:hover .feature-icon {
            transform: rotateY(360deg);
        }

        .feature-card h3 {
            font-size: 22px;
            font-weight: 600;
            margin-bottom: 15px;
            color: #1a1a1a;
        }

        .feature-card p {
            font-size: 15px;
            color: #666;
            line-height: 1.8;
        }

        /* Process Section */
        .process-section {
            padding: 10px 20px;
            background: #f8f9fa;
        }

        .process-container {
            max-width: 1200px;
            margin: 0 auto;
        }

        .process-steps {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
            gap: 40px;
            margin-top: 60px;
        }

        .process-step {
            text-align: center;
            position: relative;
        }

        .step-number {
            width: 80px;
            height: 80px;
            background: #4c87b9;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 32px;
            font-weight: 700;
            color: white;
            margin: 0 auto 25px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease;
        }

        .process-step:hover .step-number {
            transform: scale(1.1);
        }

        .process-step h3 {
            font-size: 20px;
            font-weight: 600;
            margin-bottom: 15px;
            color: #000000;
        }

        .process-step p {
            font-size: 15px;
            color: #666;
            line-height: 1.7;
        }

        /* CTA Section */
        .cta-section {
            padding: 100px 20px;
            background: linear-gradient(135deg, #5C9BD1 0%, #4c87b9 100%);
            color: white;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

            .cta-section::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                bottom: 0;
                background: radial-gradient(circle at 30% 50%, rgba(255, 255, 255, 0.08) 0%, transparent 50%), radial-gradient(circle at 70% 80%, rgba(255, 255, 255, 0.05) 0%, transparent 50%);
            }

        .cta-content {
            max-width: 800px;
            margin: 0 auto;
            position: relative;
            z-index: 2;
        }

            .cta-content h2 {
                font-size: 48px;
                font-weight: 700;
                margin-bottom: 25px;
            }

            .cta-content p {
                font-size: 20px;
                opacity: 0.9;
                margin-bottom: 40px;
                line-height: 1.8;
            }

        .cta-buttons {
            display: flex;
            gap: 20px;
            justify-content: center;
            flex-wrap: wrap;
        }

        .btn-primary, .btn-secondary {
            padding: 16px 40px;
            font-size: 16px;
            font-weight: 600;
            border-radius: 50px;
            text-decoration: none;
            transition: all 0.3s ease;
            display: inline-flex;
            align-items: center;
            gap: 10px;
            cursor: pointer;
            border: none;
        }

        .btn-primary {
            background: #ffffff;
            color: #000000;
            box-shadow: 0 10px 30px rgba(255, 255, 255, 0.2);
        }

            .btn-primary:hover {
                transform: translateY(-3px);
                box-shadow: 0 15px 40px rgba(255, 255, 255, 0.3);
            }

        .btn-secondary {
            background: rgba(255, 255, 255, 0.1);
            color: white;
            border: 2px solid rgba(255, 255, 255, 0.3);
            backdrop-filter: blur(10px);
        }

            .btn-secondary:hover {
                background: rgba(255, 255, 255, 0.2);
                border-color: rgba(255, 255, 255, 0.5);
                transform: translateY(-3px);
            }

        /* Responsive Design */
        @media (max-width: 1200px) {
            .scroll-indicator {
                display: none;
            }
        }

        @media (max-width: 1024px) {
            .portal-cards-grid {
                grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            }
        }

        @media (max-width: 768px) {
            .hero-title {
                font-size: 38px;
            }

            .hero-description {
                font-size: 17px;
            }

            .section-header h2 {
                font-size: 32px;
            }

            .section-header-inline h2 {
                font-size: 36px;
            }

            .cta-content h2 {
                font-size: 32px;
            }

            .section-header-inline {
                flex-direction: column;
                align-items: flex-start;
                gap: 20px;
            }

            .opportunity-meta-info {
                flex-direction: column;
            }

            .portal-cards-grid {
                grid-template-columns: 1fr;
            }

            .opportunity-item {
                flex: 0 0 300px;
            }
        }

        @media (max-width: 480px) {
            .hero-title {
                font-size: 32px;
            }

            .section-header-inline h2 {
                font-size: 28px;
            }

            .opportunity-item {
                flex: 0 0 280px;
            }
        }

        /* Animations */
        .fade-in-up {
            opacity: 0;
            transform: translateY(40px);
            transition: all 0.8s ease;
        }

            .fade-in-up.visible {
                opacity: 1;
                transform: translateY(0);
            }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="cphBreadcrumb" runat="Server">
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="cphPageContent" runat="Server">
    <asp:ScriptManager ID="sm" runat="server"></asp:ScriptManager>

    <asp:UpdatePanel ID="upBID_Home" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true">
        <ContentTemplate>
            <!-- Hero Section with Portal Cards -->
            <section class="hero-section">
                <div class="hero-container">
                    <div class="hero-top">
                        <!-- Centered Hero Content -->
                        <div class="hero-content">
                            <h1 class="hero-title">Tender Management System
                            </h1>
                            <p class="hero-description">
                                Digital Procurement is a centralized digital procurement unit responsible for managing and streamlining the end-to-end 
                                tendering process across the institution.and team ensures transparency, efficiency, and compliance in procurement by leveraging structured digital workflows.
                            </p>
                        </div>
                    </div>

                    <!-- Portal Cards Grid -->
                    <div class="portal-cards-grid">
                        <asp:HyperLink ID="hlLogin" runat="server" CssClass="portal-card" Font-Underline="false" NavigateUrl="~/Tenders/Login">
                            <div class="portal-icon-box">
                                <i class="fa fa-sign-in"></i>
                            </div>
                            <div class="portal-content">
                                <h3>Sign In</h3>
                                <p>Access your dashboard to manage your account details and activities.</p>
                            </div>
                        </asp:HyperLink>

                        <asp:HyperLink ID="hlRagistration" runat="server" CssClass="portal-card" Font-Underline="false" NavigateUrl="~/Tenders/Ragistration">
                            <div class="portal-icon-box">
                                <i class="fa fa-user-plus"></i>
                            </div>
                            <div class="portal-content">
                                <h3>Ragistration</h3>
                                <p>Register as a Bidder and start your procurement journey today.</p>
                            </div>
                        </asp:HyperLink>

                        <asp:HyperLink ID="hlTenderslist" runat="server" Target="_blank" CssClass="portal-card" Font-Underline="false" NavigateUrl="~/Tenders/Tenderslist">
                            <div class="portal-icon-box">
                                <i class="fa fa-file-text"></i>
                            </div>
                            <div class="portal-content">
                                <h3>Apply for Tenders</h3>
                                <p>Explore available opportunities and submit your applications.</p>
                            </div>
                        </asp:HyperLink>
                    </div>
                </div>
            </section>

            <!-- Running Business Opportunities Section - SWIPEABLE -->
            <section class="opportunities-section">
                <div class="opportunities-container">
                    <div class="section-header-inline">
                        <div class="section-title-group">
                            <div class="section-subtitle">
                                <i class="fa fa-bolt"></i>
                                <span>Live Opportunities</span>
                            </div>
                            <h2>Running business opportunities</h2>
                            <p class="section-description">
                                Explore curated procurement opportunities from leading organizations. 
                                Apply directly and grow your business.
                            </p>
                        </div>
                        <asp:HyperLink ID="hlTenderslistAll" runat="server" Target="_blank" Font-Underline="false" CssClass="view-all-link" NavigateUrl="~/Tenders/Tenderslist">
                                <span>View all</span>
                                <i class="fa fa-arrow-right"></i>
                        </asp:HyperLink>
                    </div>

                    <div class="opportunities-wrapper">

                        <div class="opportunities-grid" id="divSearchResult" runat="server" visible="false">
                            <asp:Repeater ID="rpTender" runat="server">
                                <ItemTemplate>
                                    <!-- Opportunity Card 1 -->
                                    <div class="opportunity-item fade-in-up">
                                        <div class="opportunity-content">
                                            <h3 class="opportunity-title"><%# "(" + Eval("TenderNo") + ") - " + Eval("Title")%></h3>
                                            <div class="opportunity-meta-info">
                                                <div class="meta-item">
                                                    <div class="meta-label">Deadline</div>
                                                    <div class="meta-value urgent">
                                                        <i class="fa fa-clock-o"></i>
                                                        <span><%# Eval("Remainingdays") + " Days"%></span>
                                                    </div>
                                                </div>
                                                <div class="meta-item">
                                                    <div class="meta-label">Type</div>
                                                    <div class="meta-value">
                                                        <i class="fa fa-tag"></i>
                                                        <span><%# Eval("TenderType")%></span>
                                                    </div>
                                                </div>
                                            </div>
                                            <%--<asp:HyperLink ID="hlTenderListview" runat="server" Target="_blank" CssClass="view-details-btn" Font-Underline="false" NavigateUrl='<%# "~/Tenders/Tendersinfo/" + PUMIS.CommonFunctions.EncryptBase64(Eval("TenderID").ToString()) %>' Text="View Details">--%>
                                            <span>View Details</span>
                                            <i class="fa fa-arrow-right"></i>
                                            </asp:HyperLink>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </div>
            </section>

            <!-- Features Section -->
            <section class="features-section" runat="server" visible="false">
                <div class="section-header fade-in-up">
                    <span class="section-badge">Why Choose Us</span>
                    <h2>A Fully-Featured Procurement Suite</h2>
                    <p>From simple quotations to complex tenders, our platform handles it all with precision and efficiency.</p>
                </div>

                <div class="features-grid">
                    <div class="feature-card fade-in-up">
                        <div class="feature-icon">
                            <i class="fa fa-shield"></i>
                        </div>
                        <h3>Transparency</h3>
                        <p>Complete visibility into procurement processes with real-time tracking and comprehensive audit trails.</p>
                    </div>

                    <div class="feature-card fade-in-up">
                        <div class="feature-icon">
                            <i class="fa fa-bolt"></i>
                        </div>
                        <h3>Efficiency</h3>
                        <p>Automate workflows and reduce manual tasks, cutting procurement cycle time by up to 60%.</p>
                    </div>

                    <div class="feature-card fade-in-up">
                        <div class="feature-icon">
                            <i class="fa fa-lock"></i>
                        </div>
                        <h3>Security</h3>
                        <p>Enterprise-grade security with encrypted data storage and secure authentication protocols.</p>
                    </div>

                    <div class="feature-card fade-in-up">
                        <div class="feature-icon">
                            <i class="fa fa-users"></i>
                        </div>
                        <h3>Collaboration</h3>
                        <p>Seamless communication between buyers and suppliers with integrated messaging and notifications.</p>
                    </div>

                    <div class="feature-card fade-in-up">
                        <div class="feature-icon">
                            <i class="fa fa-line-chart"></i>
                        </div>
                        <h3>Analytics</h3>
                        <p>Powerful insights and reporting tools to make data-driven procurement decisions.</p>
                    </div>

                    <div class="feature-card fade-in-up">
                        <div class="feature-icon">
                            <i class="fa fa-mobile"></i>
                        </div>
                        <h3>Mobile Ready</h3>
                        <p>Access your procurement dashboard anywhere, anytime from any device.</p>
                    </div>
                </div>
            </section>

            <!-- Process Section -->
            <section class="process-section">
                <div class="process-container">
                    <div class="section-header fade-in-up">
                        <span class="section-badge">How It Works</span>
                        <h2>Simple & Streamlined Process</h2>
                        <p>Get started in minutes and transform your procurement workflow.</p>
                    </div>

                    <div class="process-steps">
                        <div class="process-step fade-in-up">
                            <div class="step-number">1</div>
                            <h3>Register</h3>
                            <p>Create your account and set up your profile with your business details.</p>
                        </div>

                        <div class="process-step fade-in-up">
                            <div class="step-number">2</div>
                            <h3>Discover</h3>
                            <p>Browse available tenders, quotations, and pre-qualification opportunities.</p>
                        </div>

                        <div class="process-step fade-in-up">
                            <div class="step-number">3</div>
                            <h3>Apply</h3>
                            <p>Submit your bids with all required documentation through our secure platform.</p>
                        </div>

                        <div class="process-step fade-in-up">
                            <div class="step-number">4</div>
                            <h3>Win</h3>
                            <p>Get notified of results and manage your contracts efficiently.</p>
                        </div>
                    </div>
                </div>
            </section>

            <!-- CTA Section -->
            <section class="cta-section" runat="server" visible="false">
                <div class="cta-content">
                    <h2>Ready to Transform Your Procurement?</h2>
                    <p>Join hundreds of organizations already benefiting from our digital procurement platform. Start today and experience the difference.</p>
                    <div class="cta-buttons">
                         <asp:HyperLink ID="hlctaRagistration" runat="server" Font-Underline="false"  CssClass="btn-primary" NavigateUrl="~/Tenders/Ragistration">
                            <i class="fa fa-user-plus"></i> Create Account
                        </asp:HyperLink>
                         <asp:HyperLink ID="hlctaContactus" runat="server" Font-Underline="false" CssClass="btn-secondary" NavigateUrl="~/Tenders/Contactus">
                            <i class="fa fa-envelope"></i> Contact Us
                        </asp:HyperLink>
                    </div>
                </div>
            </section>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="cphScripts" runat="Server">
    <script>
        $(document).ready(function () {
            // Intersection Observer for scroll animations
            const observerOptions = {
                threshold: 0.1,
                rootMargin: '0px 0px -100px 0px'
            };

            const observer = new IntersectionObserver(function (entries) {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        entry.target.classList.add('visible');
                    }
                });
            }, observerOptions);

            // Observe all fade-in elements
            document.querySelectorAll('.fade-in-up').forEach(element => {
                observer.observe(element);
            });
        });

        // Scroll functionality for opportunities
        function scrollOpportunities(direction) {
            const container = document.getElementById('opportunitiesGrid');
            const scrollAmount = 400;

            if (direction === 'left') {
                container.scrollBy({ left: -scrollAmount, behavior: 'smooth' });
            } else {
                container.scrollBy({ left: scrollAmount, behavior: 'smooth' });
            }
        }
    </script>
</asp:Content>
