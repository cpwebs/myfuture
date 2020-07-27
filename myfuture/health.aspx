<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="health.aspx.cs" Inherits="myfuture.health" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
   
   <script type="text/javascript">
       $(document).ready(function () {
           $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
       });

       function readURL(input) {
           if (input.files && input.files[0]) {
               var reader = new FileReader();

               reader.onload = function (e) {
                   $('#imgview').attr('src', e.target.result);
               };

               reader.readAsDataURL(input.files[0]);
           }
       }

       $(function () {
           $('[id*=dateTextbox]').datepicker({
               changeMonth: true,
               changeYear: true,
               format: "mm/dd/yyyy",
               language: "tr"
           });
       });

       function CreateWaterMark(defaultText, textBoxControl) {
           if (textBoxControl.value.length == 0) {
               textBoxControl.style.color = "gray";
               textBoxControl.value = defaultText;
           }
       }

       function ClearWaterMark(defaultText, textBoxControl) {
           if (textBoxControl.value == defaultText) {
               textBoxControl.style.color = "black";
               textBoxControl.value = "";
           }
       }
   </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
     <div class="container-fluid">
      <div class="row">
         <div class="col-md-5">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col" style="text-align:center">
                           <h4>Goals</h4>
                         <div class="progress">
                            <div class="progress-bar progress-bar-success progress-bar-striped" role="progressbar"
                            aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width:40%">
                            40% Complete
                            </div>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>

                   <div class="row">
					    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:con %>' SelectCommand="SELECT * FROM [user_tbl] WHERE member_id = @user AND type = 'Health'">
					        <SelectParameters>
                              <asp:Parameter Name="user" />
                           </SelectParameters>
                        </asp:SqlDataSource>
					    <div class="col">
						    <asp:GridView class="table table-striped table-bordered" OnRowCommand="GridView2_RowCommand"  CssClass="table table-responsive" ID="GridView2" runat="server" OnSelectedIndexChanged="OnSelectedIndexChanged2" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" EmptyDataText="There are no goals to display.">
                                <Columns>
                                    <asp:ButtonField ButtonType="Button" HeaderStyle-Width="10%" CommandName="Select" HeaderText="Select" Text="Remove"/>
								    <asp:BoundField DataField="goal" HeaderStyle-Width="80%" HeaderText="Goal" SortExpression="goal"></asp:BoundField>
								    <asp:BoundField DataField="startDate" HeaderStyle-Width="100%" DataFormatString="{0:MM-dd-yyyy}" HeaderText="Start Date" SortExpression="startDate"></asp:BoundField>
								    <asp:BoundField DataField="endDate" HeaderStyle-Width="100%" DataFormatString="{0:MM-dd-yyyy}" HeaderText="End Date" SortExpression="endDate"></asp:BoundField>
								    <asp:BoundField DataField="difficulty" HeaderStyle-Width="100%" HeaderText="Difficulty" SortExpression="difficulty"></asp:BoundField>
								    <asp:BoundField DataField="type" HeaderStyle-Width="100%" HeaderText="Type" SortExpression="type"></asp:BoundField>
							    </Columns>
						    </asp:GridView>
					    </div>
			       </div>
               </div>
            </div><br />
             <div class="card">
               <div class="card-body">
                   <div class="row">
                     <div class="col" style="text-align:center">
                           <h4>Map</h4>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                   <div class="row">
                        <!--Google map-->
                        
                          <iframe src="https://maps.google.com/maps?q=manhatan&t=&z=13&ie=UTF8&iwloc=&output=embed" frameborder="0"
                            style="border:0; height:400px; width:100%; margin:10px 10px 10px 10px" allowfullscreen></iframe>
                        

                        <!--Google Maps-->
                    </div>
               </div>
            </div>
             
         </div>
            <div class="col-md-7">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col" style="text-align:center">
                           <h4>Charts</h4>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                   <div class="row">
                     <div class="col-sm-5">
                         Goal: 
                         <asp:TextBox ID="goalTextbox" runat="server" AutoCompleteType="Disabled" ForeColor="Gray" Text="Enter Goals" onfocus="ClearWaterMark('Enter Goals', this);" onblur="CreateWaterMark('Enter Goals', this);"></asp:TextBox>
                     </div>
                     <div class="col-sm-7">
                         Logs:
                         <asp:TextBox ID="logTextbox" runat="server" Width="80%" AutoCompleteType="Disabled" ForeColor="Gray" Text="Enter Log Entry" onfocus="ClearWaterMark('Enter Log Entry', this);" onblur="CreateWaterMark('Enter Log Entry', this);"></asp:TextBox>
                     </div>
                  </div>
                   <br />
                   <div class="row">
                     <div class="col-sm-5">
                         Data:
                         <asp:TextBox ID="dataTextbox" runat="server" AutoCompleteType="Disabled" ForeColor="Gray" Text="Enter Data Value" onfocus="ClearWaterMark('Enter Data Value', this);" onblur="CreateWaterMark('Enter Data Value', this);"></asp:TextBox>
                     </div>
                     <div class="col-sm-5">
                         Date:
                         <asp:TextBox ID="dateTextbox" runat="server" ReadOnly="true" AutoCompleteType="Disabled" ForeColor="Gray" Text="Enter Date" onfocus="ClearWaterMark('Enter Date', this);" onblur="CreateWaterMark('Enter Date', this);"></asp:TextBox>
                     </div>
                     <div class="col-sm-2">
                         <asp:Button ID="btnSubmit" runat="server" Text="View" Width="70" OnClick="btnSubmit_Click" />
                         <asp:Button ID="Button1" runat="server" Width="70" Text="Add" OnClick="btnSubmit_Click" />
                     </div>
                 
                  </div><br />
                   <div class="row">
					    <div class="col">
                             <div>
                                <asp:Literal ID="ltChart" runat="server"></asp:Literal>
                            </div>
					    </div>
			       </div> <br />
                   <div class="row">
					    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString='<%$ ConnectionStrings:con %>' SelectCommand="SELECT * FROM [user_tbl] WHERE member_id = @user AND type = 'Health'">
					        <SelectParameters>
                              <asp:Parameter Name="user" />
                           </SelectParameters>
                        </asp:SqlDataSource>
					    <div class="col">
						    <asp:GridView class="table table-striped table-bordered" OnRowCommand="GridView2_RowCommand"  CssClass="table table-responsive" ID="GridView1" runat="server" OnSelectedIndexChanged="OnSelectedIndexChanged2" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" EmptyDataText="There are no logs to display.">
                                <Columns>
                                    <asp:ButtonField ButtonType="Button" HeaderStyle-Width="10%" CommandName="Select" HeaderText="Select" Text="Remove"/>
								    <asp:BoundField DataField="goal" HeaderStyle-Width="80%" HeaderText="Goal" SortExpression="goal"></asp:BoundField>
								    <asp:BoundField DataField="startDate" HeaderStyle-Width="100%" DataFormatString="{0:MM-dd-yyyy}" HeaderText="Start Date" SortExpression="startDate"></asp:BoundField>
								    <asp:BoundField DataField="endDate" HeaderStyle-Width="100%" DataFormatString="{0:MM-dd-yyyy}" HeaderText="End Date" SortExpression="endDate"></asp:BoundField>
								    <asp:BoundField DataField="difficulty" HeaderStyle-Width="100%" HeaderText="Difficulty" SortExpression="difficulty"></asp:BoundField>
								    <asp:BoundField DataField="type" HeaderStyle-Width="100%" HeaderText="Type" SortExpression="type"></asp:BoundField>
							    </Columns>
						    </asp:GridView>
					    </div>
			       </div>
               </div>
            </div>
         </div>
      </div> <br />
     </div>
</asp:Content>
