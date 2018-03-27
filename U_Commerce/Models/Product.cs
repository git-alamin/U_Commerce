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

    public partial class Product
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Product()
        {
            this.Messages = new HashSet<Message>();
            this.ProductArchives = new HashSet<ProductArchive>();
            this.ProductComments = new HashSet<ProductComment>();
            this.ProductImages = new HashSet<ProductImage>();
            this.ProductLikes = new HashSet<ProductLike>();
            this.ProductRatings = new HashSet<ProductRating>();
        }
    
        public int Id { get; set; }

        [Required]
        [Display(Name = "Product Name")]
        [StringLength(100, MinimumLength = 3)]
        public string Name { get; set; }

        [DataType(DataType.MultilineText)]
        public string Description { get; set; }

        [Required]
        [Display(Name = "Category")]
        public int CategoryId { get; set; }

        [Required]
        [Display(Name = "Brand")]
        public int BrandId { get; set; }

        [Display(Name = "Condition")]
        public int? ConditionId { get; set; }

        [Required]
        [Display(Name = "User")]
        public int UserId { get; set; }

        [Display(Name = "Regular Price")]
        [DataType(DataType.Currency)]
        public double? RegularPrice { get; set; }

        [Display(Name = "Offer Price")]
        [DataType(DataType.Currency)]
        public double? OfferPrice { get; set; }


        public int? Negotiable { get; set; }

        [StringLength(1000, MinimumLength = 10)]
        public string Link { get; set; }

        [StringLength(1000, MinimumLength = 10)]
        public string Video { get; set; }
        public System.DateTime CreateDate { get; set; }
        public string Ip { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Message> Messages { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ProductArchive> ProductArchives { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ProductComment> ProductComments { get; set; }
        public virtual ProductBrand ProductBrand { get; set; }
        public virtual ProductCategory ProductCategory { get; set; }
        public virtual ProductCondition ProductCondition { get; set; }
        public virtual User User { get; set; }
        public virtual ProductClosed ProductClosed { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ProductImage> ProductImages { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ProductLike> ProductLikes { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<ProductRating> ProductRatings { get; set; }
        public virtual ProductVerified ProductVerified { get; set; }
    }
}