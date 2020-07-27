<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="career.aspx.cs" Inherits="myfuture.career" %>
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

   </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <div class="container-fluid">
      <div class="row">
         <div class="col-md-5">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col" style="text-align:center">
                           <h4>Career Goals</h4>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>

                   <div class="row">
					<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString='<%$ ConnectionStrings:con %>' SelectCommand="SELECT * FROM [user_tbl] WHERE member_id = @user AND type = 'Career'">
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
            </div>
         </div>
      </div> <br />
     </div>
</asp:Content>
