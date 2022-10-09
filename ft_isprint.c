/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_isprint.c                                       :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: vfries <vfries@student.42lyon.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/10/03 17:59:02 by vfries            #+#    #+#             */
/*   Updated: 2022/10/09 18:04:10 by vfries           ###   ########lyon.fr   */
/*                                                                            */
/* ************************************************************************** */

// See ASCII table
int	ft_isprint(int c)
{
	if (c < ' ' || c > '~')
		return (0);
	return (1);
}
