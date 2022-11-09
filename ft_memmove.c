/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_memmove.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: vfries <vfries@student.42lyon.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/10/10 15:11:33 by vfries            #+#    #+#             */
/*   Updated: 2022/11/09 23:39:46 by vfries           ###   ########lyon.fr   */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"
#include <stdlib.h>

void	*ft_memmove(void *dst, const void *src, size_t len)
{
	void	*start_dst;

	start_dst = dst;
	if (dst > src)
		ft_memcpy(dst, src, len);
	else if (dst < src)
		while (len--)
			*(unsigned char *)dst++ = *(unsigned char *)src++;
	return (start_dst);
}
