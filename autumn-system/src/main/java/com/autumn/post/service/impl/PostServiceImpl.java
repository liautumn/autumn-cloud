package com.autumn.post.service.impl;

import com.alibaba.excel.EasyExcel;
import com.autumn.easyExcel.CustomRowHeightColWidthHandler;
import com.autumn.easyExcel.RowHeightColWidthModel;
import com.autumn.easyExcel.listener.ImportExcelListener;
import com.autumn.page.ResData;
import com.autumn.post.entity.Post;
import com.autumn.post.entity.PostInsertDto;
import com.autumn.post.entity.PostSelectDto;
import com.autumn.post.entity.PostUpdateDto;
import com.autumn.post.mapper.PostMapper;
import com.autumn.post.service.PostService;
import com.autumn.result.Result;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * @author lqz
 * @date 2023-06-19 09:56:30
 * 岗位信息 ServiceImpl
 */
@Service
public class PostServiceImpl extends ServiceImpl<PostMapper, Post> implements PostService {

    @Resource
    private PostMapper postMapper;

    /**
     * 岗位信息查询
     */
    @Override
    public Result selectPost(PostSelectDto postTypeSelectDto) {
        Page<Post> page = PageHelper.startPage(postTypeSelectDto.getPageNum(), postTypeSelectDto.getPageSize());
        LambdaQueryWrapper<Post> queryWrapper = new LambdaQueryWrapper<Post>()
                .orderByAsc(Post::getPostSort);
        List<Post> postTypeList = postMapper.selectList(queryWrapper);
        return ResData.setDataTotal(page, postTypeList);
    }

    /**
     * 岗位信息新增
     */
    @Override
    public Result insertPost(PostInsertDto postTypeInsertDto) {
        Post postType = new Post();
        BeanUtils.copyProperties(postTypeInsertDto, postType);
        int i = postMapper.insert(postType);
        return i > 0 ? Result.success() : Result.fail();
    }

    /**
     * 岗位信息修改
     */
    @Override
    public Result updatePost(PostUpdateDto postTypeUpdateDto) {
        Post postType = new Post();
        BeanUtils.copyProperties(postTypeUpdateDto, postType);
        int i = postMapper.updateById(postType);
        return i > 0 ? Result.success() : Result.fail();
    }

    /**
     * 岗位信息删除
     */
    @Override
    public Result deletePost(String ids) {
        List<String> idList = Arrays.asList(ids.split(","));
        int i = postMapper.deleteBatchIds(idList);
        return i > 0 ? Result.success() : Result.fail();
    }

    /**
     * 岗位信息excel导出
     */
    @Override
    public void exportPost(PostSelectDto postSelectDto, HttpServletResponse response) {
        List<Post> list = new ArrayList<>();
        if (!postSelectDto.getTempFlag()) {
            LambdaQueryWrapper<Post> queryWrapper = new LambdaQueryWrapper<Post>()
                    .orderByAsc(Post::getPostSort);
            list = postMapper.selectList(queryWrapper);
        }
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
        response.setCharacterEncoding("utf-8");
        try {
            String sheetName = "岗位信息";
            // 这里URLEncoder.encode可以防止中文乱码
            String fileName = URLEncoder.encode(sheetName + "列表", "UTF-8").replaceAll("\\+", "%20");
            response.setHeader("Content-disposition", "attachment;filename*=utf-8''" + fileName + ".xlsx");
            List<RowHeightColWidthModel> rowHeightColWidthList = new ArrayList<>();
            //隐藏列
            rowHeightColWidthList.add(RowHeightColWidthModel.createHideColModel(sheetName, 0));
            EasyExcel.write(response.getOutputStream(), Post.class)
                    .sheet(sheetName)
                    .registerWriteHandler(new CustomRowHeightColWidthHandler(rowHeightColWidthList))
                    .doWrite(list);
        } catch (Exception e) {
            e.getMessage();
        }
    }

    @Resource
    private PostService postService;

    /**
     * 岗位信息excel导入
     */
    @Override
    public Result importPost(MultipartFile file) {
        try {
            EasyExcel.read(file.getInputStream(), Post.class, new ImportExcelListener<Post>(postService)).sheet("岗位信息").doRead();
        } catch (Exception e) {
            e.getMessage();
        }
        return Result.success();
    }
}
