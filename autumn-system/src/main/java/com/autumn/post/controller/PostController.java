package com.autumn.post.controller;

import com.autumn.menu.entity.MenuSelectDto;
import com.autumn.post.entity.PostInsertDto;
import com.autumn.post.entity.PostSelectDto;
import com.autumn.post.entity.PostUpdateDto;
import com.autumn.post.service.PostService;
import com.autumn.result.Result;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

/**
 * @author lqz
 * @date 2023-06-19 09:56:30
 * 岗位信息 Controller
 */
@RestController
@RequestMapping("/post")
public class PostController {

    @Resource
    private PostService postService;

    /**
     * 岗位信息查询
     */
    @PostMapping("/select")
    public Result selectPost(@RequestBody PostSelectDto postSelectDto) {
        return postService.selectPost(postSelectDto);
    }

    /**
     * 岗位信息新增
     */
    @PostMapping("/insert")
    public Result insertPost(@RequestBody @Validated PostInsertDto postInsertDto) {
        return postService.insertPost(postInsertDto);
    }

    /**
     * 岗位信息修改
     */
    @PostMapping("/update")
    public Result updatePost(@RequestBody @Validated PostUpdateDto postUpdateDto) {
        return postService.updatePost(postUpdateDto);
    }

    /**
     * 岗位信息删除
     */
    @GetMapping("/delete")
    public Result deletePost(@RequestParam("ids") String ids) {
        return postService.deletePost(ids);
    }

    /**
     * 岗位信息excel导出
     */
    @PostMapping("/export")
    public void exportPost(@RequestBody PostSelectDto postSelectDto, HttpServletResponse response) {
        postService.exportPost(postSelectDto, response);
    }

    /**
     * 岗位信息excel导入
     */
    @PostMapping("/import")
    public Result importPost(MultipartFile file) {
        return postService.importPost(file);
    }

}
