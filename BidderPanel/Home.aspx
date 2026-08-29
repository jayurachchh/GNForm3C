<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="BidderPanel_Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <title>Tenders</title>

    <script type="text/javascript">
        document.addEventListener('contextmenu', function (e) {
            e.preventDefault();
            return false;
        }, false);

        // Attempt to block developer tools (F12, Ctrl+Shift+I, etc.)
        document.addEventListener('keydown', function (e) {
            // Block F12
            if (e.key === 'F12' ||
                // Block Ctrl+Shift+I
                (e.ctrlKey && e.shiftKey && (e.key === 'I' || e.key === 'i')) ||
                // Block Ctrl+Shift+J
                (e.ctrlKey && e.shiftKey && (e.key === 'J' || e.key === 'j')) ||
                // Block Ctrl+Shift+C
                (e.ctrlKey && e.shiftKey && (e.key === 'C' || e.key === 'c')) ||
                // Block Ctrl+U (view source)
                (e.ctrlKey && (e.key === 'U' || e.key === 'u'))) {
                e.preventDefault();
                return false;
            }
        }, false);
    </script>

    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <meta http-equiv="Content-type" content="text/html; charset=utf-8" />
    <meta content="" name="description" />
    <meta content="" name="author" />

    <link href="https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700&subset=all" rel="stylesheet" media="all" type="text/css" />

    <% if (ConfigurationManager.AppSettings.AllKeys.Contains("IsAssetFromCDN") && Convert.ToBoolean(Convert.ToInt32(ConfigurationManager.AppSettings["IsAssetFromCDN"].ToString())))
        { %>
    <link href="https://cdn.gnums.in/Default/assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="https://cdn.gnums.in/Default/assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css" />
    <link href="https://cdn.gnums.in/Default/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="https://cdn.gnums.in/Default/assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css" />
    <link href="https://cdn.gnums.in/Default/assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css" rel="stylesheet" type="text/css" />
    <link href="https://cdn.gnums.in/Default/assets/global/plugins/bootstrap-daterangepicker/daterangepicker.min.css" rel="stylesheet" type="text/css" />
    <link href="https://cdn.gnums.in/Default/assets/global/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css" rel="stylesheet" type="text/css" />
    <link href="https://cdn.gnums.in/Default/assets/global/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css" rel="stylesheet" type="text/css" />
    <link href="https://cdn.gnums.in/Default/assets/global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css" />
    <link href="https://cdn.gnums.in/Default/assets/global/plugins/select2/css/select2.min.css" rel="stylesheet" type="text/css" />
    <link href="https://cdn.gnums.in/Default/assets/global/plugins/select2/css/select2-bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="https://cdn.gnums.in/Default/assets/global/plugins/datatables/datatables.min.css" rel="stylesheet" type="text/css" />
    <link href="https://cdn.gnums.in/Default/assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="https://cdn.gnums.in/Default/assets/global/plugins/animate/animate.css" rel="stylesheet" />
    <link href="https://cdn.gnums.in/Default/assets/global/plugins/bootstrap-multiselect/css/bootstrap-multiselect.css" rel="stylesheet" type="text/css" />
    <link href="https://cdn.gnums.in/Default/assets/global/css/components.min.css" rel="stylesheet" type="text/css" />
    <link href="https://cdn.gnums.in/Default/assets/global/css/plugins.min.css" rel="stylesheet" type="text/css" />
    <link href="https://cdn.gnums.in/Default/assets/layouts/layout3/css/layout.min.css" rel="stylesheet" type="text/css" />
    <link href="https://cdn.gnums.in/Default/assets/layouts/layout3/css/themes/default.min.css" rel="stylesheet" type="text/css" />
    <link href="https://cdn.gnums.in/Default/assets/layouts/layout3/css/custom.min.css" rel="stylesheet" type="text/css" />

    <!-- BEGIN CUSTOM STYLES -->
    <link href="https://cdn.gnums.in/Default/CSS/Minified/gn-globals-min.css" rel="stylesheet" type="text/css" />
    <link href="https://cdn.gnums.in/Default/CSS/Minified/gn-custom-min.css" rel="stylesheet" type="text/css" />
    <!-- END CUSTOM STYLES -->

    <% }
        else
        { %>
    <link href="<%=ResolveClientUrl("~/Default/assets/global/plugins/font-awesome/css/font-awesome.min.css") %>" rel="stylesheet" type="text/css" />
    <link href="<%=ResolveClientUrl("~/Default/assets/global/plugins/simple-line-icons/simple-line-icons.min.css") %>" rel="stylesheet" type="text/css" />
    <link href="<%=ResolveClientUrl("~/Default/assets/global/plugins/bootstrap/css/bootstrap.min.css") %>" rel="stylesheet" type="text/css" />
    <link href="<%=ResolveClientUrl("~/Default/assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css") %>" rel="stylesheet" type="text/css" />
    <link href="<%=ResolveClientUrl("~/Default/assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css") %>" rel="stylesheet" type="text/css" />
    <link href="<%=ResolveClientUrl("~/Default/assets/global/plugins/bootstrap-daterangepicker/daterangepicker.min.css") %>" rel="stylesheet" type="text/css" />
    <link href="<%=ResolveClientUrl("~/Default/assets/global/plugins/bootstrap-datepicker/css/bootstrap-datepicker3.min.css") %>" rel="stylesheet" type="text/css" />
    <link href="<%=ResolveClientUrl("~/Default/assets/global/plugins/bootstrap-timepicker/css/bootstrap-timepicker.min.css") %>" rel="stylesheet" type="text/css" />
    <link href="<%=ResolveClientUrl("~/Default/assets/global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css") %>" rel="stylesheet" type="text/css" />
    <link href="<%=ResolveClientUrl("~/Default/assets/global/plugins/select2/css/select2.min.css") %>" rel="stylesheet" type="text/css" />
    <link href="<%=ResolveClientUrl("~/Default/assets/global/plugins/select2/css/select2-bootstrap.min.css") %>" rel="stylesheet" type="text/css" />
    <link href="<%=ResolveClientUrl("~/Default/assets/global/plugins/datatables/datatables.min.css") %>" rel="stylesheet" type="text/css" />
    <link href="<%=ResolveClientUrl("~/Default/assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.css") %>" rel="stylesheet" type="text/css" />
    <link href="<%=ResolveClientUrl("~/Default/assets/global/plugins/animate/animate.css")%>" rel="stylesheet" />
    <link href="<%=ResolveClientUrl("~/Default/assets/global/plugins/bootstrap-multiselect/css/bootstrap-multiselect.css")%>" rel="stylesheet" type="text/css" />
    <link href="<%=ResolveClientUrl("~/Default/assets/global/css/components.min.css") %>" rel="stylesheet" id="style_components" type="text/css" />
    <link href="<%=ResolveClientUrl("~/Default/assets/global/css/plugins.min.css") %>" rel="stylesheet" type="text/css" />
    <link href="<%=ResolveClientUrl("~/Default/assets/layouts/layout3/css/layout.min.css") %>" rel="stylesheet" type="text/css" />
    <link href="<%=ResolveClientUrl("~/Default/assets/layouts/layout3/css/themes/default.min.css") %>" rel="stylesheet" type="text/css" id="style_color" />
    <link href="<%=ResolveClientUrl("~/Default/assets/layouts/layout3/css/custom.min.css") %>" rel="stylesheet" type="text/css" />

    <!-- BEGIN CUSTOM STYLES -->
    <link href="<%=ResolveClientUrl("~/Default/CSS/Minified/gn-globals-min.css")%>" rel="stylesheet" type="text/css" />
    <link href="<%=ResolveClientUrl("~/Default/CSS/Minified/gn-custom-min.css")%>" rel="stylesheet" type="text/css" />
    <!-- END CUSTOM STYLES -->
    <% } %>
    <link rel="shortcut icon" id="logoicon" runat="server" />

    <asp:Literal ID="ltrGoogleAnalytics" runat="server" EnableViewState="false" />

    <style>
        .page-header .page-header-menu {
            height: 90px;
            background-color: #fff;
            box-shadow: 0 1px 40px rgba(0,0,0,0.08);
        }

        /* Logo */
        .page-logo {
            float: left;
            padding: 10px 0;
        }

        .page-header .page-header-menu .hor-menu .navbar-nav > li > a,
        .page-header .page-header-menu .hor-menu .navbar-nav > li > a > i {
            color: #000000;
            background: transparent;
        }

            .page-header .page-header-menu .hor-menu .navbar-nav > li:hover > a,
            .page-header .page-header-menu .hor-menu .navbar-nav > li > a:hover,
            .page-header .page-header-menu .hor-menu .navbar-nav > li > a:focus,
            .page-header .page-header-menu .hor-menu .navbar-nav > li > a:active {
                color: #007bff !important;
                background: transparent !important;
            }

        .hor-menu {
            float: right;
        }

            .hor-menu .main-menu {
                list-style: none;
                padding: 0 150px;
            }

            .hor-menu .nav > li > a {
                text-decoration-color: #000000;
                color: #000000;
                font-weight: 500;
                font-size: 14px;
                line-height: 50px;
                text-decoration: none;
            }

                /* Hover */
                .hor-menu .nav > li > a:hover {
                    color: var(--primary);
                }

        /* Contact section spacing */
        .header-contact > li > a {
            font-size: 13px;
            color: #555 !important;
            padding: 0 10px;
            line-height: 50px;
        }

        /* Icon spacing */
        .header-contact i {
            margin-right: 5px;
        }

        /* Hover effect */
        .header-contact > li > a:hover,
        .header-contact > li > a:hover i {
            color: #007bff !important;
            background: transparent !important;
        }


        /*Hero - Title + Small Cards Beside*/
        .hero {
            /*background: linear-gradient(135deg, var(--white) 0%, var(--light) 100%);*/
            padding: 0 6rem 100px;
            /*min-height: 65vh;*/
            display: flex;
            align-items: center;
            position: relative;
            overflow: hidden;
        }

            .hero::before {
                content: '';
                position: absolute;
                top: 0;
                left: 0;
                right: 0;
                height: 400px;
                /*background: radial-gradient(ellipse at top, rgba(37,99,235,0.05) 0%, transparent 70%);*/
            }

        .hero-container {
            max-width: 1400px;
            margin-top: 50px;
            margin-left: 60px;
            display: grid;
            grid-template-columns: 1fr 400px;
            gap: 7rem;
            align-items: stretch;
            position: relative;
            z-index: 2;
        }

        .hero-content h1 {
            font-size: 6rem;
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
            font-size: 1.9rem;
            color: var(--secondary);
            margin-bottom: 2rem;
            max-width: 800px;
        }

        /* Container */

        .portlet.portal-card {
            border-radius: 18px !important;
        }

        .portal-grid {
            margin-top: 25px;
        }

        /* Card */
        .portal-card {
            display: block;
            background: #ffffff;
            padding: 18px 18px;
            margin-bottom: 18px;
            border-radius: 18px !important; /* smoother curve */
            box-shadow: 0 4px 20px rgba(0,0,0,0.08);
            text-decoration: none;
            transition: all 0.3s ease;
            border: 1px solid #f1f3f5;
            overflow: hidden;
        }

            /* Hover */
            .portal-card:hover {
                box-shadow: 0 30px 35px rgba(0,0,0,0.12);
                transform: translateY(-4px);
                border-color: #007bff;
            }

        /* Icon */
        .portal-icon {
            width: 50px;
            height: 50px;
            background: linear-gradient(135deg, #3b82f6, #2563eb);
            border-radius: 12px; /* more modern */
            display: flex;
            align-items: center;
            justify-content: center;
        }

            /* Icon inside */
            .portal-icon i {
                color: #fff;
                font-size: 18px;
            }

        /* Text */
        .portal-title {
            font-size: 17px;
            font-weight: 600;
            margin: 0;
            color: #1e293b;
        }

        /* Subtitle */
        .portal-desc {
            font-size: 13px;
            color: #6b7280;
            margin: 2px 0 0;
        }


        /* Sections */
        /*section {*/
        /*padding: 100px 2rem;*/
        /*}

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
            font-size: 0.85rem;
            font-weight: 600;
            margin-bottom: 1.5rem;
            box-shadow: var(--shadow);
        }

        .section-header h2 {
            font-size: 3rem;
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
        }*/

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

        /* Section Background */
        .tender-section {
            background: #f8fafc;
            /*padding: 100px 20px;*/
        }

        /* Center Container */
        /*.container {
            max-width: 1100px;
            margin: 0 auto;
        }*/

        /* Header Center */
        /*.section-header {
            text-align: center;
        }*/

        /* Badge */
        /*.section-badge {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 8px 22px;
            border-radius: 50px !important;
            background: linear-gradient(135deg, #3b82f6, #2563eb);
            color: #fff;
            font-size: 14px;
            font-weight: 600;
            margin-bottom: 20px;
            box-shadow: 0 4px 15px rgba(59,130,246,0.3);
        }*/

        /* Badge Icon */
        /*.section-badge i {
                font-size: 13px;
            }*/

        /* Title */
        /*.section-header h2 {
            font-size: 48px;
            font-weight: 800;
            color: #1e293b;
            margin-bottom: 15px;
            letter-spacing: -1px;
        }*/

        /* Subtitle */
        /*.section-header p {
            font-size: 18px;
            color: #64748b;
            max-width: 600px;
            margin: 0 auto;
        }*/

        /* Section Background */
        .tender-section {
            background: #f8fafc;
        }

        /* Container (KEEP ONLY ONE) */
        .container {
            max-width: 1100px;
            margin: 0 auto;
        }

        /* Section Header */
        .section-header {
            text-align: center;
            margin-bottom: 60px;
        }

        /* Badge (ONLY ONE FINAL VERSION) */
        .section-badge {
            display: inline-flex;
            align-items: center;
            gap: 8px;
            padding: 8px 22px;
            border-radius: 50px !important;
            background: linear-gradient(135deg, #3b82f6, #2563eb);
            color: #fff;
            font-size: 14px;
            font-weight: 600;
            margin-bottom: 20px;
            box-shadow: 0 4px 15px rgba(59,130,246,0.3);
        }

            /* Badge Icon */
            .section-badge i {
                font-size: 13px;
            }

        /* Title */
        .section-header h2 {
            font-size: 48px;
            font-weight: 800;
            color: #1e293b;
            margin-bottom: 15px;
            letter-spacing: -1px;
        }

        /* Subtitle */
        .section-header p {
            font-size: 18px;
            color: #64748b;
            max-width: 600px;
            margin: 0 auto;
        }
    </style>
</head>

<body class="page-header-menu-fixed page-container-bg-solid page-footer-fixed">
    <form id="form1" runat="server">

        <div class="page-wrapper">
            <div class="page-wrapper-row">
                <div class="page-header">

                    <div class="page-header-menu">
                        <div class="container-fluid">
                            <div class="page-logo">
                                <asp:Image runat="server" ID="imgLogo" Style="max-height: 95px; width: 150px" alt="logo" />
                            </div>
                            <div class="hor-menu">

                                <ul class="nav navbar-nav main-menu" id="MenuUL" runat="server">
                                    <li runat="server">
                                        <asp:HyperLink ID="hlHome" runat="server" NavigateUrl="~/Tenders" Text="Home"></asp:HyperLink>
                                    </li>
                                    <li runat="server">
                                        <asp:HyperLink ID="hlAbout" runat="server" NavigateUrl="~/Tenders/Aboutus" Text="About Us"></asp:HyperLink>
                                    </li>
                                    <li runat="server">
                                        <asp:HyperLink ID="hlContact" runat="server" NavigateUrl="~/Tenders/Contactus" Text="Contact Us"></asp:HyperLink>
                                    </li>
                                    <li runat="server">
                                        <asp:HyperLink ID="hlSignin" runat="server" NavigateUrl="~/Tenders/Login" Text="Sign In"></asp:HyperLink>
                                    </li>
                                    <li runat="server">
                                        <asp:HyperLink ID="hlRagister" runat="server" NavigateUrl="~/Tenders/Ragistration" Text="Ragister"></asp:HyperLink>
                                    </li>
                                </ul>

                                <ul class="nav navbar-nav navbar-right header-contact">

                                    <li>
                                        <a>
                                            <i class="fa fa-phone"></i>+91 98765 43210
                                        </a>
                                    </li>

                                    <li>
                                        <a>
                                            <i class="fa fa-envelope"></i>info@tender.com
                                        </a>
                                    </li>

                                    <li>
                                        <a>
                                            <i class="fa fa-comments"></i>+91 98765 43210
                                         </a>
                                    </li>

                                </ul>

                            </div>
                        </div>

                    </div>
                </div>


                <section id="home" class="hero">
                    <div class="hero-container">
                        <div class="hero-content">
                            <h1>Tender Management System</h1>
                            <p class="hero-subtitle">
                                Digital Procurement is a centralized digital procurement unit responsible for managing and streamlining the end-to-end 
                                tendering process across the institution.and team ensures transparency, efficiency, and compliance in procurement by 
                                leveraging structured digital workflows.
                            </p>
                        </div>

                        <div class="portal-grid">

                            <!-- SIGN IN -->
                            <a href="#" class="portal-card">
                                <div class="media">
                                    <div class="media-left">
                                        <div class="portal-icon">
                                            <i class="fa fa-sign-in"></i>
                                        </div>
                                    </div>
                                    <div class="media-body">
                                        <h4 class="portal-title">Sign In</h4>
                                        <p class="portal-desc">Access dashboard</p>
                                    </div>
                                </div>
                            </a>

                            <!-- REGISTER -->
                            <a href="#" class="portal-card">
                                <div class="media">
                                    <div class="media-left">
                                        <div class="portal-icon">
                                            <i class="fa fa-user-plus"></i>
                                        </div>
                                    </div>
                                    <div class="media-body">
                                        <h4 class="portal-title">Register</h4>
                                        <p class="portal-desc">Create free account</p>
                                    </div>
                                </div>
                            </a>

                            <!-- APPLY -->
                            <a href="#" class="portal-card">
                                <div class="media">
                                    <div class="media-left">
                                        <div class="portal-icon">
                                            <i class="fa fa-file-text"></i>
                                        </div>
                                    </div>
                                    <div class="media-body">
                                        <h4 class="portal-title">Apply Tenders</h4>
                                        <p class="portal-desc">Browse & bid now</p>
                                    </div>
                                </div>
                            </a>

                        </div>
                    </div>
                </section>

                <section id="tenders" class="container">
                    <div class="section-header">
                        <span class="section-badge"><i class="fa fa-bolt"></i>Live Opportunities</span>
                        <h2>Active Tenders</h2>
                        <p>Browse verified tenders from government and corporate sectors.</p>
                    </div>
                    <%--<div class="opportunities-grid">
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
                    </div>--%>
                </section>

            </div>
        </div>

        <% if (ConfigurationManager.AppSettings.AllKeys.Contains("IsAssetFromCDN") && Convert.ToBoolean(Convert.ToInt32(ConfigurationManager.AppSettings["IsAssetFromCDN"].ToString())))
            { %>
        <!-- BEGIN CORE PLUGINS -->
        <script src="https://cdn.gnums.in/Default/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
        <script src="https://cdn.gnums.in/Default/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="https://cdn.gnums.in/Default/assets/global/plugins/js.cookie.min.js" type="text/javascript"></script>
        <script src="https://cdn.gnums.in/Default/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
        <script src="https://cdn.gnums.in/Default/assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
        <script src="https://cdn.gnums.in/Default/assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
        <script src="https://cdn.gnums.in/Default/assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js" type="text/javascript"></script>
        <script src="https://cdn.gnums.in/Default/assets/global/plugins/jquery-ui/jquery-ui.min.js" type="text/javascript"></script>
        <script src="https://cdn.gnums.in/Default/assets/global/plugins/select2/js/select2.full.min.js" type="text/javascript"></script>
        <script src="https://cdn.gnums.in/Default/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js" type="text/javascript"></script>
        <script src="https://cdn.gnums.in/Default/assets/global/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js" type="text/javascript"></script>
        <script src="https://cdn.gnums.in/Default/assets/global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js" type="text/javascript"></script>
        <script src="https://cdn.gnums.in/Default/assets/global/scripts/datatable.js" type="text/javascript"></script>
        <script src="https://cdn.gnums.in/Default/assets/global/plugins/datatables/datatables.min.js" type="text/javascript"></script>
        <script src="https://cdn.gnums.in/Default/assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.js" type="text/javascript"></script>
        <script src="https://cdn.gnums.in/Default/assets/global/plugins/bootbox/bootbox.min.js"></script>
        <script src="https://cdn.gnums.in/Default/assets/global/scripts/app.min.js" type="text/javascript"></script>
        <script src="https://cdn.gnums.in/Default/assets/pages/scripts/components-date-time-pickers.min.js" type="text/javascript"></script>
        <script src="https://cdn.gnums.in/Default/assets/global/plugins/bootstrap-multiselect/js/bootstrap-multiselect.js" type="text/javascript"></script>
        <script src="https://cdn.gnums.in/Default/assets/layouts/layout3/scripts/layout.min.js" type="text/javascript"></script>
        <script src="https://cdn.gnums.in/Default/assets/layouts/layout3/scripts/demo.min.js" type="text/javascript"></script>
        <script src="https://cdn.gnums.in/Default/assets/layouts/global/scripts/quick-sidebar.min.js" type="text/javascript"></script>
        <script src="https://cdn.gnums.in/Default/assets/layouts/global/scripts/quick-nav.min.js" type="text/javascript"></script>
        <!-- END THEME LAYOUT SCRIPTS -->

        <script src="https://cdn.gnums.in/Default/global/plugins/tinymce/tinymce.bundle.js"></script>
        <script src="https://cdn.gnums.in/Default/global/plugins/tinymce/UI_TinyMCE.js"></script>

        <!-- BEGIN CUSTOM SCRIPTS -->

        <script src="https://cdn.gnums.in/Default/JS/UI_Select2.js" type="text/javascript"></script>
        <script src="https://cdn.gnums.in/Default/JS/GN_UI.js" type="text/javascript"></script>
        <script src="https://cdn.gnums.in/Default/JS/CommonValidation.js" type="text/javascript"></script>
        <script src="https://cdn.gnums.in/Default/JS/CommonJSFunctions.js" type="text/javascript"></script>
        <script src="https://cdn.gnums.in/Default/JS/UI_ModalEvents.js" type="text/javascript"></script>
        <script src="https://cdn.gnums.in/Default/JS/UI_BlockUI.js" type="text/javascript"></script>
        <script src="https://cdn.gnums.in/Default/JS/GN_InitMain.js" type="text/javascript"></script>

        <!-- END CUSTOM SCRIPTS -->
        <% }
            else
            { %>
        <!-- BEGIN CORE PLUGINS -->
        <script src="<%=ResolveClientUrl("~/Default/assets/global/plugins/jquery.min.js") %>" type="text/javascript"></script>
        <script src="<%=ResolveClientUrl("~/Default/assets/global/plugins/bootstrap/js/bootstrap.min.js") %>" type="text/javascript"></script>
        <script src="<%=ResolveClientUrl("~/Default/assets/global/plugins/js.cookie.min.js") %>" type="text/javascript"></script>
        <script src="<%=ResolveClientUrl("~/Default/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js") %>" type="text/javascript"></script>
        <script src="<%=ResolveClientUrl("~/Default/assets/global/plugins/jquery.blockui.min.js") %>" type="text/javascript"></script>
        <script src="<%=ResolveClientUrl("~/Default/assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js") %>" type="text/javascript"></script>
        <script src="<%=ResolveClientUrl("~/Default/assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js") %>" type="text/javascript"></script>
        <script src="<%=ResolveClientUrl("~/Default/assets/global/plugins/jquery-ui/jquery-ui.min.js") %>" type="text/javascript"></script>
        <script src="<%=ResolveClientUrl("~/Default/assets/global/plugins/select2/js/select2.full.min.js") %>" type="text/javascript"></script>
        <script src="<%=ResolveClientUrl("~/Default/assets/global/plugins/bootstrap-datepicker/js/bootstrap-datepicker.min.js") %>" type="text/javascript"></script>
        <script src="<%=ResolveClientUrl("~/Default/assets/global/plugins/bootstrap-timepicker/js/bootstrap-timepicker.min.js") %>" type="text/javascript"></script>
        <script src="<%=ResolveClientUrl("~/Default/assets/global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js") %>" type="text/javascript"></script>
        <script src="<%=ResolveClientUrl("~/Default/assets/global/scripts/datatable.js") %>" type="text/javascript"></script>
        <script src="<%=ResolveClientUrl("~/Default/assets/global/plugins/datatables/datatables.min.js") %>" type="text/javascript"></script>
        <script src="<%=ResolveClientUrl("~/Default/assets/global/plugins/datatables/plugins/bootstrap/datatables.bootstrap.js") %>" type="text/javascript"></script>
        <script src="<%=ResolveClientUrl("~/Default/assets/global/plugins/bootbox/bootbox.min.js")%>"></script>
        <script src="<%=ResolveClientUrl("~/Default/assets/global/scripts/app.min.js") %>" type="text/javascript"></script>
        <script src="<%=ResolveClientUrl("~/Default/assets/pages/scripts/components-date-time-pickers.min.js") %>" type="text/javascript"></script>
        <script src="<%=ResolveClientUrl("~/Default/assets/global/plugins/bootstrap-multiselect/js/bootstrap-multiselect.js")%>" type="text/javascript"></script>
        <script src="<%=ResolveClientUrl("~/Default/assets/layouts/layout3/scripts/layout.min.js") %>" type="text/javascript"></script>
        <script src="<%=ResolveClientUrl("~/Default/assets/layouts/layout3/scripts/demo.min.js") %>" type="text/javascript"></script>
        <script src="<%=ResolveClientUrl("~/Default/assets/layouts/global/scripts/quick-sidebar.min.js") %>" type="text/javascript"></script>
        <script src="<%=ResolveClientUrl("~/Default/assets/layouts/global/scripts/quick-nav.min.js") %>" type="text/javascript"></script>
        <!-- END THEME LAYOUT SCRIPTS -->

        <script src="<%=ResolveClientUrl("~/Default/global/plugins/tinymce/tinymce.bundle.js") %>"></script>
        <script src="<%=ResolveClientUrl("~/Default/global/plugins/tinymce/UI_TinyMCE.js") %>"></script>

        <!-- BEGIN CUSTOM SCRIPTS -->

        <script src="<%=ResolveClientUrl("~/Default/JS/UI_Select2.js") %>" type="text/javascript"></script>
        <script src="<%=ResolveClientUrl("~/Default/JS/GN_UI.js") %>" type="text/javascript"></script>
        <script src="<%=ResolveClientUrl("~/Default/JS/CommonValidation.js") %>" type="text/javascript"></script>
        <script src="<%=ResolveClientUrl("~/Default/JS/CommonJSFunctions.js") %>" type="text/javascript"></script>
        <script src="<%=ResolveClientUrl("~/Default/JS/UI_ModalEvents.js") %>" type="text/javascript"></script>
        <script src="<%=ResolveClientUrl("~/Default/JS/UI_BlockUI.js") %>" type="text/javascript"></script>
        <script src="<%=ResolveClientUrl("~/Default/JS/GN_InitMain.js") %>" type="text/javascript"></script>

        <!-- END CUSTOM SCRIPTS -->
        <% } %>
    </form>
</body>
</html>
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

    window.addEventListener('scroll', () => {
        const header = document.querySelector('.page-header');

        if (window.scrollY > 50) {
            header.style.background = '#ffffff';
            header.style.boxShadow = '0 2px 20px rgba(0,0,0,0.1)';
        } else {
            header.style.background = '#ffffff';
            header.style.boxShadow = 'none';
        }
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
