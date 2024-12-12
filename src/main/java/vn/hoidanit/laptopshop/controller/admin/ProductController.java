package vn.hoidanit.laptopshop.controller.admin;

import java.util.List;
import java.util.Optional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import jakarta.validation.Valid;
import vn.hoidanit.laptopshop.domain.Product;
import vn.hoidanit.laptopshop.service.ProductService;
import vn.hoidanit.laptopshop.service.UploadService;

@Controller
public class ProductController {

    private final ProductService productService;
    private final UploadService uploadService;

    public ProductController(ProductService productService, UploadService uploadService) {
        this.productService = productService;
        this.uploadService = uploadService;
    }

    @GetMapping("/admin/product")
    public String getProductPage(Model model, @RequestParam("page") Optional<String> pageOptional) {
        int page = 1;
        try {
            if (pageOptional.isPresent()) {
                // convert
                page = Integer.parseInt(pageOptional.get());
            } else {
                // mac dinh page = 1
            }
        } catch (Exception e) {
            // page = 1
            // to do : handle exception
        }
        Pageable pageable = PageRequest.of(page - 1, 5);

        Page<Product> products = this.productService.fetchProducts(pageable);
        List<Product> listProducts = products.getContent();
        model.addAttribute("products", listProducts);
        model.addAttribute("currentPage", page);
        model.addAttribute("totalPages", products.getTotalPages());
        return "admin/product/show";
    }

    @GetMapping("/admin/product/create") // GET
    public String getCreateProductPage(Model model) {
        model.addAttribute("newProduct", new Product());
        return "admin/product/create";
    }

    @PostMapping("/admin/product/create")
    public String createProductPage(Model model,
            @ModelAttribute("newProduct") @Valid Product stallProduct, BindingResult newProductBindingResult,
            @RequestParam("productFile") MultipartFile file) {

        // validate
        // validate
        List<FieldError> errors = newProductBindingResult.getFieldErrors();
        for (FieldError error : errors) {
            System.out.println(error.getField() + " - " + error.getDefaultMessage());
        }
        if (newProductBindingResult.hasErrors()) {
            return "admin/product/create";
        }

        String productImg = this.uploadService.handleSaveUploadFile(file, "product"); // luu ten file
        stallProduct.setImage(productImg);
        ;

        // save
        this.productService.handleSaveProduct(stallProduct);
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/{id}")
    public String getProductDetailPage(Model model, @PathVariable long id) {
        Product productDetail = this.productService.fetchProductById(id).get();
        model.addAttribute("id", id);
        model.addAttribute("productDetail", productDetail);
        return "admin/product/detail";
    }

    @GetMapping("/admin/product/update/{id}") // GET
    public String getUpdateProductPage(Model model, @PathVariable long id) {
        Optional<Product> currentProduct = this.productService.fetchProductById(id);
        model.addAttribute("updateProduct", currentProduct.get());
        return "admin/product/update";
    }

    @PostMapping("/admin/product/update") // GET
    public String postUpdateProduct(Model model, @ModelAttribute("updateProduct") @Valid Product stallProduct,
            BindingResult newProductBindingResult,
            @RequestParam("productFile") MultipartFile file) {
        Product currentProduct = this.productService.fetchProductById(stallProduct.getId()).get();
        if (newProductBindingResult.hasErrors()) {

            model.addAttribute("image", currentProduct.getImage());
            return "admin/product/update";
        }
        if (currentProduct != null) {
            if (!file.isEmpty()) {

                String productImg = this.uploadService.handleSaveUploadFile(file, "product");
                currentProduct.setImage(productImg);
            }
            currentProduct.setName(stallProduct.getName());
            currentProduct.setPrice(stallProduct.getPrice());
            currentProduct.setDetailDesc(stallProduct.getDetailDesc());
            currentProduct.setShortDesc(stallProduct.getShortDesc());
            currentProduct.setQuantity(stallProduct.getQuantity());
            currentProduct.setFactory(stallProduct.getFactory());
            currentProduct.setTarget(stallProduct.getTarget());
            this.productService.handleSaveProduct(currentProduct);
        }
        model.addAttribute("updateProduct", currentProduct);
        return "redirect:/admin/product";
    }

    @GetMapping("/admin/product/delete/{id}")
    public String getDeleteProductPage(Model model, @PathVariable long id) {
        model.addAttribute("id", id);
        model.addAttribute("deleteProduct", new Product());
        return "admin/product/delete";
    }

    @PostMapping("/admin/product/delete")
    public String postDeleteProduct(Model model, @ModelAttribute("deleteProduct") Product stallProduct) {
        this.productService.deleteProductById(stallProduct.getId());
        return "redirect:/admin/product";
    }

}
