//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace U_Commerce.Models
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public partial class User
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public User()
        {
            this.LoginHistories = new HashSet<LoginHistory>();
            this.Messages = new HashSet<Message>();
            this.Products = new HashSet<Product>();
            this.ProductArchives = new HashSet<ProductArchive>();
            this.ProductComments = new HashSet<ProductComment>();
            this.ProductLikes = new HashSet<ProductLike>();
            this.ProductRatings = new HashSet<ProductRating>();
        }
    
        public int Id { get; set; }

        [Required]
        [Display(Name = "User Name")]
        [StringLength(100, MinimumLength = 3)]
        public string Name { get; set; }

        [Required]
        [DataType(DataType.PhoneNumber)]
        public string Contact { get; set; }

        [Required]
        [EmailAddress]
        public string Email { get; set; }

        [Required]
        [DataType(DataType.Password)]
        public string Password { get; set; }

        [Required]
        public int Gender { get; set; }

        [Required]
        [DataType(DataType.Date)]
        public System.DateTime JoinDate { get; set; }

        public string Ip { get; set; }

        [DataType(DataType.Date)]
        public Nullable<System.DateTime> DateOfBirth { get; set; }

        [Required]
        [StringLength(300, MinimumLength = 3)]
        public string Address { get; set; }

        [Required]
        [Display(Name = "City")]
        public int CityId { get; set; }

        
        public string Image { get; set; }
    
        public virtual AdminUser AdminUser { get; set; }
        public virtual City City { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<LoginHistory> LoginHistories { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Message> Messages { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Product> Products { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ProductArchive> ProductArchives { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ProductComment> ProductComments { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ProductLike> ProductLikes { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ProductRating> ProductRatings { get; set; }
        public virtual UserVerified UserVerified { get; set; }
    }
}
