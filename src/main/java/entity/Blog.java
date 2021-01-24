package entity;

import lombok.*;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
@Table(name = "blog")
@ToString(exclude = "categoryList")
public class Blog {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;
    @Column(name = "title")
    private String title;
    @Column(name = "description")
    private String description;
    @Column(name = "created_date")
    private Date createdDate;
    @Column(name = "image_path")
    private String image;
    @ManyToOne()
    private User user;
    @ManyToMany( fetch = FetchType.EAGER,cascade = {CascadeType.PERSIST,CascadeType.REFRESH})
    @JoinTable(name = "blogs_categories", joinColumns = @JoinColumn(name = "blog_id"),
            inverseJoinColumns = @JoinColumn(name = "category_id"))
    private Set<Category> categoryList;

}
