<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CarouselWithInfo.ascx.cs" Inherits="WebSchool.Controls.ContentPages.CarouselWithInfo" %>

   <!-- With Animation and Info Carousel -->
 <div class="row">
                            <div class="col-sm-12 col-12">
                                <!-- With Animation and Info Carousel Block -->
                                <div class="block">
                                    <!-- With Animation and Info Carousel Title -->
                                    <div class="block-title">
                                        <h2><strong>Animation</strong> and <strong>Info</strong></h2>
                                    </div>
                                    <!-- END With Animation and Info Carousel Title -->

                                    <!-- With Animation and Info Carousel Content -->
                                    <div id="example-carousel" class="carousel slide">
                                        <!-- Indicators -->
                                        <ol class="carousel-indicators">
                                            <li data-target="#example-carousel" data-slide-to="0" class="active"></li>
                                            <li data-target="#example-carousel" data-slide-to="1"></li>
                                            <li data-target="#example-carousel" data-slide-to="2"></li>
                                            <li data-target="#example-carousel" data-slide-to="3"></li>
                                        </ol>
                                        <!-- END Indicators -->

                                        <!-- Wrapper for slides -->
                                        <div class="carousel-inner">
                                          
                                                 <div class="active item" style="height:250px">
                                             <%--   <img src="../assets/img/placeholders/photos/photo20.jpg" alt="image">--%>
                                                 <img src="../../assets/img/placeholders/photos/photo1@2x.jpg" />
                                                <div class="carousel-caption">
                                                    <p>Caption..</p>
                                                </div>
                                            </div>
                                            <div class="item" style="height:250px">
                                                <%--<img src="../assets/img/placeholders/photos/photo19.jpg" alt="image">--%>
                                                 <img src="../../assets/img/placeholders/photos/photo1@2x.jpg" />
                                                <div class="carousel-caption">
                                                    <p>Caption..</p>
                                                </div>
                                            </div>
                                            <div class="item" style="height:250px">
                                                <img src="../../assets/img/placeholders/photos/photo1@2x.jpg" />
                                               <%-- <img src="../../assets/img/placeholders/backgrounds/lock_full_bg.jpg" />--%>
                                            <%--    <img src="../assets/img/placeholders/photos/photo18.jpg" alt="image">--%>
                                                <div class="carousel-caption">
                                                    <p>Caption..</p>
                                                </div>
                                            </div>
                                             <div class="item" style="height:250px">
                                               <%-- <img src="../assets/img/placeholders/photos/photo22.jpg" alt="image">--%>
                                                 <img src="../../assets/img/placeholders/photos/photo1@2x.jpg" />
                                                <div class="carousel-caption">
                                                    <p>Caption..</p>
                                                </div>
                                            </div>
                                        </div>
                                        <!-- END Wrapper for slides -->

                                        <!-- Controls -->
                                        <a class="left carousel-control" href="#example-carousel" data-slide="prev">
                                            <span><i class="fa fa-chevron-left"></i></span>
                                        </a>
                                        <a class="right carousel-control" href="#example-carousel" data-slide="next">
                                            <span><i class="fa fa-chevron-right"></i></span>
                                        </a>
                                        <!-- END Controls -->
                                    </div>
                                    <!-- END With Animation and Info Carousel Content -->
                                </div>
                                <!-- END With Animation and Info Carousel Block -->
                            </div>
                            <!-- END With Animation and Info Carousel -->
     </div>