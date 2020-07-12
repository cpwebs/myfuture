<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="myfuture.homepage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style='overflow-x: hidden;'>
    <section>
      <img src="imgs/winter.jpg" class="img-fluid"/>
   </section>
   <section>
      <div class="container">
         <div class="row">
            <div class="col-12" style="text-align:center">
                  <br/><h2>Achieve Personal Growth</h2>
                  <p><b>Choose Your Path</b></p>
            </div>
         </div>
         <div class="row">
            <div class="col-md-4" style="text-align:center">
                  <img width="150" src="imgs/heart2.jpg"/>
                  <h4>Health</h4>
                  <p class="text-justify">Inspect and improve wellness and healthy habits to promote a wholesome lifestyle. See how your sleep, nutrition, and fitness are play a role in your health.</p>
            </div>
            <div class="col-md-4" style="text-align:center">
                  <img width="150" src="imgs/briefcase2.jpg"/>
                  <h4>Career</h4>
                  <p class="text-justify">Seek out paths needed to reach your professional job and how you can achieve them. Aspire to become anything from a regional manager to a CEO.</p>
            </div>
            <div class="col-md-4" style="text-align:center">
                  <img width="150" src="imgs/money.jpeg"/>
                  <h4>Finance</h4>
                  <p class="text-justify">Track your spending and decide what needs to be fixed to improve your financial situation. Loans, monthly payments, and emergency funds all pile up to produce more financial worry</p>
            </div>
         </div>
      </div>
       <br /><br />
   </section>

      
   <section>
           <asp:DataGrid HorizontalAlign="Center" AutoGenerateColumns="False" HeaderStyle-Font-Bold="true" BorderStyle="Solid" BorderWidth="5" CellPadding="15" HeaderStyle-BackColor="#5E7790" HeaderStyle-ForeColor="White" AlternatingItemStyle-BackColor="#9EC7E7" ID="DataGrid1" runat="server">  
           <Columns>
                <asp:BoundColumn DataField="goal" HeaderText="Goal" >
                </asp:BoundColumn>
               <asp:BoundColumn DataField="startDate" DataFormatString="{0:MM-dd-yyyy}" HeaderText="Start Date" >
                </asp:BoundColumn>
               <asp:BoundColumn DataField="endDate" DataFormatString="{0:MM-dd-yyyy}" HeaderText="End Date" >
                </asp:BoundColumn>
               <asp:BoundColumn DataField="difficulty" HeaderText="Difficulty" >
                </asp:BoundColumn>
               <asp:BoundColumn DataField="type" HeaderText="Type" >
                </asp:BoundColumn>
            </Columns>
           </asp:DataGrid>  
           <br /><br />
   </section>
      
   <section>
       <div class="row">
          <div class="column">
            <img src="imgs/running.jpg" style="width:100%">
          </div>
          <div class="column">
            <img src="imgs/finance.jpg" style="width:100%">
          </div>
           <div class="column">
            <img src="imgs/sleeping.jpg" style="width:100%">
          </div>
          <div class="column">
            <img src="imgs/professional.jpg" style="width:100%">
          </div>
       </div>
       <br />
   </section>

   <section>
      <div class="container">
         <div class="row">
            <div class="col-12" style="text-align:center">
                  <h2>How to Get Started</h2>
                  <p><b>Follow These Steps</b></p>
            </div>
         </div>
         <div class="row">
            <div class="col-md-4" style="text-align:center">
                  <img width="150" src="imgs/signup.png" class="img-fluid"/>
                  <br /><br /><h4>Sign Up</h4>
                  <p class="text-justify">Signing up is quick and easy! Enter valid information that are geared for your needs.</p>
            </div>
            <div class="col-md-4" style="text-align:center">
                  <img width="150" src="imgs/search.png" class="img-fluid"/>
                  <br /><br /><h4>Search Goals</h4>
                  <p class="text-justify">Choose from our extensive list of ways to grow and push yourself to your limits. New goals are posted daily and are geared towards your interests.</p>
            </div>
            <div class="col-md-4" style="text-align:center">
                  <img width="150" src="imgs/accomplish.jpg" class="img-fluid"/>
                  <br /><br /><h4>Accomplish</h4>
                  <p class="text-justify">Finish your goals and reflect upon how much improvement you have made. Track your progress and growth over time as your complete more goals.</p>
            </div>
         </div>
      </div>
       <br /><br />
   </section>
        </div>
</asp:Content>
