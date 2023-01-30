using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using projfluttersection2.Models;
using System.Web;
using System.IO;

namespace projfluttersection2.Controllers
{
    public class UserController : ApiController
    {
        FlutterSection2Entities db = new FlutterSection2Entities();
        [HttpPost]
        public HttpResponseMessage UpdateProfileImage()
        {
            try
            {
                HttpRequest request = HttpContext.Current.Request;
                var imagefile=request.Files["photo"];
                
   
                int id = int.Parse(request["id"]);
                string extension = imagefile.FileName.Split('.')[1];
                DateTime dt = DateTime.Now;
                String filename = id + "_" + dt.Year + dt.Month + dt.Day + dt.Minute + dt.Second + dt.Hour+"."+extension;
               // filename = filename + DateTime.Now.ToShortTimeString()+"."+extension;
                imagefile.SaveAs(HttpContext.Current.Server.
                               MapPath("~/Content/Uploads/"+filename));
               var user= db.AppUsers.Where(x => x.id == id).FirstOrDefault();
                user.image = filename;
                db.SaveChanges();
                return Request.CreateResponse(HttpStatusCode.OK, "Uploaded");
                
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, ex.Message);
            }

        }


        [HttpPost]
        public HttpResponseMessage Signup(AppUser newuser)
        {
            try
            {
                var user = db.AppUsers.Where(s => s.email == newuser.email).FirstOrDefault();
                if (user != null)
                    return Request.CreateResponse(HttpStatusCode.OK, "Exsist");
                
                db.AppUsers.Add(newuser);
                db.SaveChanges();
                return Request.CreateResponse(HttpStatusCode.OK, "Created");

            }
            catch (Exception ex)
            {

                return Request.CreateResponse(HttpStatusCode.InternalServerError, ex.Message);
            }
        }
        [HttpPost]
        public HttpResponseMessage CreateNewAccount(string email,string password,string role)
        {
            try
            {
                var user = db.AppUsers.Where(s => s.email == email).FirstOrDefault();
                if (user != null)
                    return Request.CreateResponse(HttpStatusCode.OK, "Exsist");
                AppUser newuser = new AppUser();
                newuser.email = email;
                newuser.password = password;
                newuser.role = role;
                db.AppUsers.Add(newuser);
                db.SaveChanges();
                return Request.CreateResponse(HttpStatusCode.OK, "Created");

            }
            catch (Exception ex)
            {

                return Request.CreateResponse(HttpStatusCode.InternalServerError, ex.Message);
            }
        }
        [HttpGet]
        public HttpResponseMessage Login(string email,string password)
        {
            try
            {
                var user = db.AppUsers.Where(s => s.email == email && s.password == password).FirstOrDefault();
                if (user == null)
                {
                    return Request.CreateResponse(HttpStatusCode.OK, "false");

                }
                return Request.CreateResponse(HttpStatusCode.OK,user);

            }
            catch (Exception ex)
            {

                return Request.CreateResponse(HttpStatusCode.InternalServerError, ex.Message);
            }
           
        }
        
        [HttpPost]
        public HttpResponseMessage NewAccount()
        {
            try
            {
                HttpRequest request = HttpContext.Current.Request;
               
                string email = request["email"];
                var user = db.AppUsers.Where(s => s.email == email).FirstOrDefault();
                if (user != null)
                    return Request.CreateResponse(HttpStatusCode.OK, "Exsist");
                AppUser newuser = new AppUser();
                newuser.email = email;
                newuser.password = request["password"];
                newuser.role = request["role"];
                db.AppUsers.Add(newuser);
                db.SaveChanges();
                return Request.CreateResponse(HttpStatusCode.OK, "Created");
            }
            catch (Exception ex)
            {
                return Request.CreateResponse(HttpStatusCode.InternalServerError, ex.Message);
            }

        }
    
    
    }
}









